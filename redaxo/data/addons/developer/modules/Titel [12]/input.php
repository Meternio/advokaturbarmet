<?php
$mform = new MForm();

$mform->addTextField('1', array('label' => 'Titel'));
$mform->addTextField('2', array('label' => 'Anker'));
$mform->addCheckboxField('3', array('label' => 'Fungiert als Back to top-Button'));
$mform->addCheckboxField('4', array('label' => 'Linien nicht bis ganz nach Aussen rendern'));
echo $mform->show();
?>