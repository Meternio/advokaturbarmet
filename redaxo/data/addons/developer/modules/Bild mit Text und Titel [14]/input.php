<?php
$mform = new MForm();
$mform->addFieldset('Inhalt und Einstellungen');
$mform->addSelectField('1', array('left' => 'Links', 'right' => 'Rechts'), array('label' => 'Bildausrichtung'));
$mform->addMediaField('1', array('label' => 'Bild'));
$mform->addTextField('2', array('label' => 'Titel'));
$mform->addTextField('3', array('label' => 'Untertitel'));
$mform->addTextAreaField('4', array('label' => 'Text','class' => 'redactor-editor--links_only'));
$mform->addCheckboxField('5', array('label' => 'Titel nicht ausmitten'));
$mform->closeFieldset();
echo $mform->show();
?>