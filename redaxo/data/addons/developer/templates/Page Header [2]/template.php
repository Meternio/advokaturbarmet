<?php
// Language Switcher
if (isset($_POST['langUpdate'])) {
    $clang = $_POST['langUpdate'];
    $article = rex_article::getCurrent($clang);
    echo $article->getUrl();
    exit;
}

// Change Menu on Language Switch
if (isset($_POST['getMenu'])) {
    $clang = $_POST['getMenu'];
    Menu::getMenu(3, $clang);
    exit;
}

// Change Menu Logo Link on Language Switch
if (isset($_POST['getHeaderLogo'])) {
    $clang = $_POST['getHeaderLogo'];
    Menu::getHeaderLogo('<svg width="21" height="35" viewBox="0 0 21 35" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M2.49207 3.26796e-07C0.837851 1.09871e-07 -1.42774e-07 1.08876 -3.39863e-07 2.59172C-5.19881e-07 3.9645 0.547828 4.44971 2.5243 6.16569L12.2992 14.7574L12.2992 14.8166L2.50281 14.8166C0.848593 14.8166 0.0107419 15.9053 0.0107417 17.4083C0.0107415 18.9112 0.848593 20 2.50281 20L18.5079 20C20.1621 20 21 18.9112 21 17.4083C21 16.0355 20.4522 15.5266 18.4757 13.8343L8.70077 5.24261L8.70077 5.18344L18.4972 5.18344C20.1514 5.18344 20.9893 4.09468 20.9893 2.59172C20.9893 1.08876 20.1514 2.64254e-06 18.4972 2.42561e-06L2.49207 3.26796e-07Z" fill="white"/><path d="M2.49207 15C0.837851 15 -1.42774e-07 16.0888 -3.39863e-07 17.5917C-5.19881e-07 18.9645 0.547828 19.4497 2.5243 21.1657L12.2992 29.7574L12.2992 29.8166L2.50281 29.8166C0.848593 29.8166 0.0107419 30.9053 0.0107417 32.4083C0.0107415 33.9112 0.848593 35 2.50281 35L18.5079 35C20.1621 35 21 33.9112 21 32.4083C21 31.0355 20.4522 30.5266 18.4757 28.8343L8.70077 20.2426L8.70077 20.1834L18.4972 20.1834C20.1514 20.1834 20.9893 19.0947 20.9893 17.5917C20.9893 16.0888 20.1514 15 18.4972 15L2.49207 15Z" fill="white"/></svg>', $clang);
    exit;
}

if(isset($_POST['checkForIntro'])) {
    $firstSlice = rex_article_slice::getFirstSliceForArticle(rex_article::getCurrentId(), rex_clang::getCurrentId());
    $hasIntro = false;
    if(!empty($firstSlice)) {
        $hasIntro = $firstSlice->getId() === 1;
    }
    $introClass = $hasIntro ? 'add' : 'remove';
    echo $introClass;
    exit;
}

// *********************
// VARIABLES
// *********************
$seo = new rex_yrewrite_seo();
$rootCategories = rex_category::getRootCategories();
$metaValues = get_object_vars(Table::getValues('nullmeta', false, 'asc', false))[0];

// Check if intro is set as first slice
$firstSlice = rex_article_slice::getFirstSliceForArticle(rex_article::getCurrentId(), rex_clang::getCurrentId());
$hasIntro = false;
if(!empty($firstSlice)) {
    $hasIntro = $firstSlice->getId() === 1;
}
$introClass = $hasIntro ? 'has__intro' : '';
$menuBarColor = $hasIntro ? '' : ' black';
$contentPadding = $hasIntro ? '' : ' padding';

?>
<!doctype html>
<html lang="<?php echo rex_clang::getCurrent()->getCode(); ?>">
<head>
    <base href="<?php echo rex::getServer(); ?>"/>
    <title><?php echo $seo->getTitle(); ?></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv='Content-Type' content='text/html; charset=utf-8'>
    <meta name="format-detection" content="telephone=no">
    <meta name="revisit-after" content="7">
    <meta name="robots" content="index,follow">

    <meta name="description" content="<?php echo $seo->getDescription(); ?>">
    <meta name="keywords" content="<?php echo $metaValues->getValue('seo_basis_keywords');?>">
    <meta name="pace-topic" content="<?php echo $metaValues->getValue('seo_basis_keywords');?>">
    <meta name="topic" content="<?php echo $metaValues->getValue('seo_basis_keywords');?>">
    <meta name="audience" content="<?php echo $metaValues->getValue('seo_basis_audience');?>">

    <meta name="geo.position" content="<?php echo $metaValues->getValue('seo_basis_company_coordinates');?>">
    <meta name="geo.placename" content="<?php echo $metaValues->getValue('seo_basis_company_street').', '.$metaValues->getValue('seo_basis_company_city');?>">

    <meta name="author" content="<?php echo $metaValues->getValue('seo_basis_author');?>">
    <meta name="owner" content="<?php echo $metaValues->getValue('seo_basis_company_name');?>">
    <meta name="reply-to" content="<?php echo $metaValues->getValue('seo_basis_company_email');?>">
    <meta name="copright" content="<?php echo $metaValues->getValue('seo_basis_company_name').', '.$seo->getCanonicalUrl();?>">

    <meta property="og:title" content="<?php echo $seo->getTitle(); ?>">
    <meta property="og:description" content="<?php echo $seo->getDescription(); ?>">
    <meta property="og:site_name" content="<?php echo rex::getServerName(); ?>">

    <meta property="og:image" content="ressources/favs/apple-touch-icon.png"> <!-- TODO -->
    <meta property="og:secure_url" content="<?php echo rex::getServer()?>>">
    <meta property="og:image:alt" content="Favicon">
    <meta property="og:image:type" content="image/png">
    <meta property="og:locale" content="<?php echo $SEOLangCode ?>>">
    <meta property="og:site_name" content="<?php echo $metaValues->getValue('seo_basis_company_name'); ?>>">
    <meta property="og:email" content="<?php echo $metaValues->getValue('seo_basis_company_email');?>">
    <meta property="og:latitude" content="<?php echo explode(',',str_replace(' ', '', $metaValues->getValue('seo_basis_company_coordinates')))[0];?>">
    <meta property="og:longitude" content="<?php echo explode(',',str_replace(' ', '', $metaValues->getValue('seo_basis_company_coordinates')))[1];?>">
    <meta property="og:street-address" content="<?php echo $metaValues->getValue('seo_basis_company_street');?>">
    <meta property="og:locality" content="<?php echo $metaValues->getValue('seo_basis_company_city');?>">
    <meta property="og:postal-code" content="<?php echo $metaValues->getValue('seo_basis_company_zip');?>">
    <meta property="og:country-name" content="<?php echo $metaValues->getValue('seo_basis_company_country');?>">

    <meta property="twitter:title" content="<?php echo $seo->getTitle(); ?>">
    <meta property="twitter:description" content="<?php echo $seo->getDescription(); ?>">
    <meta property="twitter:image" content="ressources/favs/apple-touch-icon.png"> <!-- TODO -->
    <meta property="twitter:card" content="summary_large_image">

    <link rel="apple-touch-icon" sizes="180x180" href="/ressources/favs/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/ressources/favs/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/ressources/favs/favicon-16x16.png">
    <link rel="manifest" href="/ressources/favs/site.webmanifest">
    <link rel="mask-icon" href="/ressources/favs/safari-pinned-tab.svg" color="#000000">
    <link rel="shortcut icon" href="/ressources/favs/favicon.ico">
    <meta name="msapplication-TileColor" content="#4b4b4b">
    <meta name="msapplication-config" content="/ressources/favs/browserconfig.xml">
    <meta name="theme-color" content="#ffffff">

    <link rel="stylesheet" href="ressources/css/style.min.css">
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>

    <link href="//google.ch" rel="dns-prefetch">
    <link href="//google.de" rel="dns-prefetch">
    <link href="//google.com" rel="dns-prefetch">
    <link href="//google-analytics.com" rel="dns-prefetch">
    <link href="//facebook.com" rel="dns-prefetch">
    <link href="//vimeo.com" rel="dns-prefetch">
</head>
<?php echo '<body data-routing="wrapper" class="' . $introClass . '" data-analytics="' . rex_global_settings::getValue('analytics_id') . '">' ?>


