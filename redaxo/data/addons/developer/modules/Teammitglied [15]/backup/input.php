<?php
$mform = new MForm();
    $mform->addTextField('1', array('label' => 'Name / Bezeichnung'));
    $mform->addTextAreaField('2', array('label' => 'Text','class' => 'redactor-editor--links_only'));
    $mform->addMediaField('1', array('label' => 'Bild Overlay'));
    $mform->addMediaField('2', array('label' => 'Bild Vorschau'));
    $mform->addSelectField('3', array('left' => 'Links', 'right' => 'Rechts'), array('label' => 'Position Bildvorschau'));
    $mform->addSelectField('4', array('3' => '3 Spalten', '4' => '4 Spalten', '5' => '5 Spalten', '6' => '6 Spalten'), array('label' => 'Breite Bildvorschau'));
    $mform->addMediaField('3', array('label' => 'CV'));
echo $mform->show();
?>