<?php
$mform = new MForm();
$mform->addFieldset('Inhalt und Einstellungen');
    $mform->addSelectField('1', array('left' => 'Links', 'right' => 'Rechts'), array('label' => 'Bildausrichtung'));
    $mform->addMediaField('1', array('label' => 'Bild'));
    $mform->addTextAreaField('2', array('label' => 'Text','class' => 'redactor-editor--links_only'));
    $mform->addCheckboxField('4', array('label' => 'Titel nicht ausmitten'));
$mform->closeFieldset();
$mform->addFieldset('Links hinzufügen');
echo $mform->show();

$mblockID = '3';
$mblock = new MForm();
    $mblock->addFieldset('Link');
    $mblock->addTextField("$mblockID.0.linkText", array('label' => 'Linktext'));
    $mblock->addLinkField("$mblockID.0.REX_LINK_1", array('label' => 'interner Link'));
    $mblock->addTextField("$mblockID.0.anchor", array('label' => 'interner Anker'));
    $mblock->addTextField("$mblockID.0.external", array('label' => 'externer Link', 'placeholder' => 'Achtung, dieses Feld überschreibt das Feld «interner Link»'));
echo MBlock::show($mblockID, $mblock, array('initial-hidden' => '1'));
?>