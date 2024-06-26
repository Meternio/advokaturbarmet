<?php
/**
 * This file is part of the redactor package.
 *
 * @author (c) Friends Of REDAXO
 * @author <friendsof@redaxo.org>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

class Redactor
{
    public static function createProfileFiles()
    {
        $sql = rex_sql::factory();
        $profiles = $sql->getArray('SELECT * FROM `'.rex::getTable('redactor_profile').'`');

        $redactorProfiles = [];
        foreach ($profiles as $profile) {
            $name = $profile['name'];

            $redactorProfiles[$name]['redaxo']['regex']['id'] = '(.*?)\s\[.*?\]';

            $minHeight = 300;
            if ((int)$profile['min_height'] > 0) {
                $minHeight = (int)$profile['min_height'];
            }
            $maxHeight = 300;
            if ((int)$profile['max_height'] > 0) {
                $maxHeight = (int)$profile['max_height'];
            }

            $redactorProfiles[$name]['minHeight'] = $minHeight.'px';
            $redactorProfiles[$name]['maxHeight'] = $maxHeight.'px';

            $redactorPlugins = [];
            if ('' !== trim($profile['plugins'])) {
                $plugins = explode(',', trim($profile['plugins']));

                foreach ($plugins as $plugin) {
                    $plugin = trim($plugin);
                    if (preg_match('/(.*)\[(.*)\]/', $plugin, $matches)) {
                        $parameters = explode('|', $matches[2]);
                        $parameterString = [];
                        foreach ($parameters as $parameter) {
                            if (strpos($parameter, '=') !== false) {
                                list($key, $value) = explode('=', $parameter, 2);
                                $parameterString[] = [$key, $value];
                            } else {
                                $parameterString[] = $parameter;
                            }
                        }
                        $redactorProfiles[$name]['redaxo'][$matches[1]] = $parameterString;
                        $redactorPlugins[] = $matches[1];
                    } else {
                        $redactorPlugins[] = $plugin;
                    }
                }
            }

            if ($profile['plugin_counter'] === '1') {
                $redactorPlugins[] = 'counter';
            }

            if ((int)$profile['plugin_limiter'] > 0) {
                $redactorPlugins[] = 'limiter';
                $redactorProfiles[$name]['limiter'] = (int)$profile['plugin_limiter'];
            }

            $redactorProfiles[$name]['buttons'] = [];
            $redactorProfiles[$name]['plugins'] = $redactorPlugins;
        }

        $content = 'redactor_profiles = '.json_encode($redactorProfiles, JSON_PRETTY_PRINT).';';
        $cacheFile = rex_path::addonCache('redactor', 'profiles.js');
        if (false === rex_file::put($cacheFile, $content)) {
            echo rex_view::error(rex_i18n::msg('error_save_profiles'));
        }

        rex_file::copy($cacheFile, rex_addon::get('redactor')->getAssetsPath('cache/profiles.js'));
    }


    public static function createPluginFile()
    {
        $dirs = rex_extension::registerPoint(
            new rex_extension_point('REDACTOR_PLUGIN_DIR',
                [rex_addon::get('redactor')->getAssetsPath('plugins')]
            )
        );

        $plugins = [];
        foreach ($dirs as $dir) {
            if (!file_exists($dir)) {
                continue;
            }
            foreach (rex_finder::factory($dir)->filesOnly()->sort() as $file) {
                $plugins[] = rex_file::get($file);
            }
        }

        $langKeys = self::loadPluginLanguageKeys();
        foreach (rex_i18n::getLocales() as $locale) {
            $translations = [];
            foreach ($langKeys as $langKey => $de) {
                $translations[$langKey] = rex_i18n::msgInLocale('redactor_plugin_'.$langKey, $locale);
            }

            $content = 'let redactorLang = "'.substr($locale, 0, 2).'";'."\n\n";
            $content .= 'let redactorTranslations = '.json_encode($translations, JSON_PRETTY_PRINT).';'."\n\n";
            $content .= implode("\n", $plugins);

            $cacheFile = rex_path::addonCache('redactor', 'plugins.'.$locale.'.js');
            if (false === rex_file::put($cacheFile, $content)) {
                echo rex_view::error(rex_i18n::msg('redactor_error_save_profiles'));
            }

            rex_file::copy($cacheFile, rex_addon::get('redactor')->getAssetsPath('cache/plugins.'.$locale.'.js'));
        }
    }


    private static function loadPluginLanguageKeys()
    {
        /** @todo add extension point REDACTOR_LANG_DIR */
        $dirs = [rex_addon::get('redactor')->getPath('lang')];
        $msg = [];
        foreach ($dirs as $dir) {
            $file =  $dir.DIRECTORY_SEPARATOR.'de_de.lang';
            if (($content = rex_file::get($file)) && preg_match_all('/^redactor_plugin_([^=\s]+)\h*=\h*(\S.*)(?<=\S)/m', $content, $matches, PREG_SET_ORDER)) {
                foreach ($matches as $match) {
                    $msg[$match[1]] = $match[2];
                }
            }
        }
        return $msg;
    }
}
