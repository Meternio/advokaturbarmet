<?php

if(!empty($_POST)) {
    $endData = [];

    $rawData = array(
        'seo_basis' => $_POST['seo_basis'],
        'google_analytics' => $_POST['google_analytics'],
        'cookie_banner' => $_POST['cookie_banner'],
    );

    foreach($rawData as $key => $array) {
        $keyBase = $key . '_';

        foreach($array as $subkey => $value) {
            $endData[$keyBase.$subkey] = $value;
        }
    }
    dump($endData);
    Table::setValue('nullmeta', '1', $endData);
}

$addon = rex_addon::get('nullSpace');
echo rex_view::title('SEO Basis und Meta für «'.$_SERVER['SERVER_NAME'].'»'); // $addon->i18n('title') ist eine Kurzform für rex_i18n::msg('demo_addon_title')
$subpage = rex_be_controller::getCurrentPagePart(2);
rex_be_controller::includeCurrentPageSubPath();

// Start Config output
$rootCats = rex_category::getRootCategories();

echo '<div style="display: flex; flex-wrap: wrap; background: #4b9ad9; padding: 30px; color: white; border-radius: 5px; margin-top: 35px; margin-bottom: 35px;">';
echo '<h4 style="width: 100%; margin-top: 0; font-weight: bold;">Wichtige Information:</h4>';
echo '<p style="margin: 0;">Es wird dringend empfohlen, untenstehendes Formular sorgfältig auszufüllen. Die Daten sind für die Google-Suchergebnisse und das korrekte indexieren der Webseite relevant.</p>';
echo '</div>';

$addon = rex_addon::get('nullSpace');

// Instanzieren des Formulars
$form = rex_config_form::factory('nullSpace');

// SEO Daten
$form->addFieldset('SEO Basis');
$field = $form->addSelectField('index', $value = null, ['class' => 'form-control selectpicker']);
$field->setLabel('Indexierung');
$select = $field->getSelect();
$select->addOption('Verbieten', 'noindex,nofollow');
$select->addOption('Erlauben', 'index,follow');

$field = $form->addInputField('text', 'company_name', null, ['class' => 'form-control','placeholder' => 'Dein Firmenname']);
$field->setLabel('Firmenname');

$field = $form->addInputField('text', 'company_street', null, ['class' => 'form-control','placeholder' => 'Strasse eingeben']);
$field->setLabel('Strasse');

$field = $form->addInputField('text', 'company_city', null, ['class' => 'form-control','placeholder' => 'Stadt eingeben']);
$field->setLabel('Ort');

$field = $form->addInputField('text', 'company_zip', null, ['class' => 'form-control','placeholder' => 'Postleitzahl eingeben']);
$field->setLabel('Postleitzahl');

$field = $form->addInputField('text', 'company_country', null, ['class' => 'form-control','placeholder' => 'Land eingeben']);
$field->setLabel('Land');

$field = $form->addInputField('text', 'company_email', null, ['class' => 'form-control','placeholder' => 'Firmen-Email-Adresse eingeben']);
$field->setLabel('E-Mail');

$field = $form->addInputField('text', 'company_coordinates', null, ['class' => 'form-control', 'placeholder' => '47.42046250746478, 8.557836508369322']);
$field->setLabel('E-Mail');



$field = $form->addTextAreaField('audience', null, ['class' => 'form-control','placeholder' => 'Zielpublikum 1, Zielpublikum 2, kommasepariert']);
$field->setLabel('Zielpublikum der Webseite (Kommasepariert)');

$field = $form->addTextAreaField('keywords', null, ['class' => 'form-control', 'placeholder' => 'Suchwort 1, Suchwort 2, kommasepariert']);
$field->setLabel('Keywords der Webseite (Kommasepariert)');

$field = $form->addTextAreaField('author', null, ['class' => 'form-control', 'placeholder' => 'Author eingeben']);
$field->setLabel('Author');

// Ausgabe des Formulars
$fragment = new rex_fragment();
$fragment->setVar('class', 'edit', false);
$fragment->setVar('title', 'Datenformular', false);
$fragment->setVar('body', $form->get(), false);
echo $fragment->parse('core/page/section.php');
