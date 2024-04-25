<?php

class Meta
{
    public static function getMeta($filter = false, $articleID = false, $clang = false)
    {
        $clang = $clang === false ? rex_clang::getCurrentId() : $clang;
        $article = !($articleID) ? rex_article::get(rex_article::getCurrentId(), $clang) : rex_article::get($articleID, $clang);
        $data = get_object_vars($article);
        $filter = !$filter ? 'art_' : 'art_' . $filter;

        $values = [];

        foreach ($data as $key => $value) {
            if (strpos($key, $filter) !== false) {
                $values[$key] = $value;
            }
        }

        return count($values) > 1 ? $values : array_values($values)[0];
    }
}


class Table
{
    public static function getValues($table = false, $orderBy = false, $sort = 'asc', $status = true, $where = false, $whereValue = 'status')
    {
        $result = null;

        if ($table !== false) {
            $table = rex_yform_manager_table::get('rex_' . $table);

            if (!empty($table)) {

                $query = $table->query()->alias('a');

                if ($status) {
                    $query->where('a.status', '1');
                }

                if($where !== false) {
                    $query->where('a.'.$where, $whereValue);
                }

                if ($orderBy !== false) {
                    $query->orderBy($orderBy, $sort);
                }

                $result = $query->find();
            }
        }

        return $result;
    }

    public static function addRow($table = false, $values = [])
    {
        if ($table !== false) {
            $dataManager = rex_yform_manager_dataset::create('rex_' . $table);

            if (!empty($dataManager)) {
                foreach ($values as $key => $value) {
                    $dataManager->setValue($key, $value);
                }

                $dataManager->save();
            }
        }
    }

    public static function deleteRow($table = false, $where = false, $match = false)
    {
        if ($table !== false && $where !== false && $match !== false) {
            $table = rex_yform_manager_table::get('rex_' . $table);

            if (!empty($table)) {
                $table->query()->where($where, $match)->find()->delete();
            }
        }
    }

    public static function setValue($table = false, $id = false, $values = [])
    {
        if ($table !== false && $id !== false) {
            if (intval($id) <= count(get_object_vars(rex_yform_manager_dataset::getAll('rex_' . $table)))) {
                $dataManager = rex_yform_manager_dataset::get($id, 'rex_' . $table);

                foreach ($values as $key => $value) {
                    $value = htmlentities($value, ENT_QUOTES | ENT_HTML5, 'utf-8');
                    $dataManager->$key = $value;
                }

                $dataManager->save();
            }
        }
    }
}

class Simplify {
    public static function getPictureTag($imageURL) {
        $imgObj =  rex_media::get($imageURL);
        if(!empty($imgObj)) {
            return media_manager_plus_frontend::generatePictureTag($imgObj->getExtension(), $imgObj->getFileName());
        } else {
            exit;
        }
    }

    public static function formatLink($url) {
        return 'https://'.str_replace('https://',  '', $url);
    }

    public static function getGermanDate($date) {
        $date = str_replace('.', '-', $date);
        setlocale(LC_TIME, "de_DE");
        $newDate = str_replace('-', ' ', date("d-M-Y", strtotime($date)));
        return $newDate;
    }
}



class Menu
{
    public static function getMenu($maxDepth = 0, $clang = false, $reverseDepth = true, $home = false, $ignoreOffline = true)
    {
        $clang = $clang === false ? rex_clang::getCurrentId() : $clang;

        $output = '<ul data-language="' . $clang . '">';

        $rootCategories = rex_category::getRootCategories($ignoreOffline, $clang);
        $excludedIndex = !$home ? 1 : 0;

        // Loop through online root categories
        foreach ($rootCategories as $index => $category) {

            // Check if home should be in the list and if category is online
            if ($index >= $excludedIndex) {

                $startArticle = $category->getStartArticle();
                $startArticleName = $startArticle->getName();
                $startArticleUrl = $startArticle->getUrl();
                $articles = $category->getArticles($ignoreOffline);
                $hasDepth = count($articles) > 1 && $maxDepth > 0;
                $dataString = $hasDepth ? ' class="sub--' . $index . '"' : '';
                $activeClass = $startArticle->getId() === rex_article::getCurrentId() ? 'class="active"' : '';
                $output .= '<li' . $dataString . '><a data-cursor-static '.$activeClass.' href="' . $startArticleUrl . '" title="' . $startArticleName . '">' . $startArticleName . '</a>';

                // Go into depth
                array_shift($articles);
                if ($reverseDepth) {
                    $articles = array_reverse($articles);
                }

                if ($hasDepth) {
                    $output .= '<div class="menu__more" data-js data-js-target=".sub--' . $index . '"></div>';
                    $output .= '<ul>';

                    foreach ($articles as $i => $article) {
                        if ($i <= $maxDepth - 1) {
                            $activeClass = $article->getId() === rex_article::getCurrentId() ? 'class="active"' : '';
                            $articleName = $article->getName();
                            $articleUrl = $article->getUrl();

                            $output .= '<li><a data-cursor-static '.$activeClass.' href="' . $articleUrl . '" title="' . $articleName . '">' . $articleName . '</a></li>';
                        }
                    }

                    $output .= '</ul>';
                }

                $output .= '</li>';
            }
        }

        $output .= '</ul>';
        echo $output;
    }

    public static function getLangMenu()
    {
        $languages = rex_clang::getAll(true);

        // Loop throug languages and output links
        if (count($languages) > 1) {
            $activeLanguage = rex_clang::getCurrentId();

            $output = '<ul class="navigation__lang">';

            foreach ($languages as $language) {
                $activeClass = $language->getId() === $activeLanguage ? ' class="active"' : '';

                $languageName = $language->getName();
                $langID = strval($language->getId());

                $article = rex_article::get(rex_article::getCurrentId(), $langID);
                $url = $article->getUrl();
                $name = $article->getName();

                $output .= '<li' . $activeClass . '><a href="' . $url . '" title="' . $name . '" data-lang-id="' . $langID . '">' . $languageName . '</a></li>';
            }

            $output .= '</ul>';

            echo $output;
        }
    }

    public static function getHeaderLogo($svgMarkup, $clang = false)
    {
        $clang = $clang === false ? rex_clang::getCurrentId() : $clang;
        $articleID = rex_article::getSiteStartArticle()->getId();
        $article = rex_article::get($articleID, $clang);
        $url = $article->getUrl();
        $name = $article->getName();

        echo '
            <a href="' . $url . '" title="' . $name . '" data-cursor-static>
                <div class="header__logo">
                    ' . $svgMarkup . '
                </div>
            </a>
        ';
    }

    public static function getBreadcrumb($home = true)
    {
        $articles = array();

        $currentArticle = rex_article::get(rex_article::getCurrent()->getId(), rex_clang::getCurrentId());
        $articles[0] = array(
            'name' => $currentArticle->getName(),
            'url' => $currentArticle->getUrl(),
            'id' => $currentArticle->getId()
        );

        $parentArticle = $currentArticle->getParentTree();
        $articles[1] = array(
            'name' => $parentArticle[0]->getName(),
            'url' => $parentArticle[0]->getUrl(),
            'id' => $parentArticle[0]->getId()
        );

        $counter = 2;
        while ($parentArticle[0]->getPath() !== '|') {
            $parentArticle = $parentArticle[0]->getParentTree();
            $articles[$counter] = array(
                'name' => $parentArticle[0]->getName(),
                'url' => $parentArticle[0]->getUrl(),
                'id' => $parentArticle[0]->getId()
            );

            $counter++;
        }

        dump($articles);
    }
}



?>