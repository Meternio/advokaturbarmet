<?php
$setting = 'REX_VALUE[1]';

$output = '';

switch ($setting) {
    case 'auto':
        $rootCats = rex_category::getRootCategories(false, rex_clang::getCurrentId());
        $output .= '<ul>';
        foreach ($rootCats as $cat) {
            $article = $cat->getStartArticle();
            $articleID = $article->getId();
            $articleName = $article->getName();
            $articleURL = $article->getUrl();
            if ($articleID !== 7 && $articleID !== 13) {
                $output .= '<li><a href="' . $articleURL . '" title="' . $articleName . '">' . $articleName . '</a></li>';
            }
        }
        $output .= '</ul>';
        break;
    case 'manual':
        $links = rex_var::toArray('REX_VALUE[10]');
        $output .= '<ul>';
        foreach ($links as $link) {
            $linkText = $link['linkText'];
            $linkInternal = $link['REX_LINK_1'];
            $linkExternal = $link['internal'];
            $linkDownload = $link['REX_MEDIA_1'];

            $isExternal = !empty($linkExternal);
            $isDownload = !empty($linkDownload);

            if ($isDownload) {
                $output .= '<li><a href="/media/' . $linkDownload . '" download="download" data-cursor-static title="' . $linkText . '">' . $linkText . '</a></li>';
            } else if ($isExternal) {
                $linkExternal = Simplify::formatLink($linkExternal);
                $output .= '<li><a href="' . $linkExternal . '" rel="noreferrer" target="_blank" data-cursor-static title="' . $linkText . '">' . $linkText . '</a></li>';
            } else {

                $article = rex_article::get($linkInternal, rex_clang::getCurrentId());
                if (!empty($article)) {
                    $linkText = $article->getName();
                    $linkText = !empty($link['linkText']) ? $link['linkText'] : $linkText;
                    if (!empty($article)) {
                        $articleURL = $article->getUrl();
                        $articleName = $article->getName();
                        $output .= '<li><a href="' . $articleURL . '" data-cursor-static title="' . $articleName . '">' . $linkText . '</a></li>';
                    }
                }
            }
        }
        $output .= '</ul>';
        break;
    default:
        break;
}

echo $output;
?>