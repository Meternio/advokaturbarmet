<?php
$mform = new MForm();
    $mform->addTextField('1', array('label' => 'Kontaktzeile 1'));
    $mform->addTextField('2', array('label' => 'Kontaktzeile 2'));
    $mform->addTextField('3', array('label' => 'Telefon'));
    $mform->addTextField('4', array('label' => 'Email'));

    $mform->addTextField('5', array('label' => 'Postadresse'));
echo $mform->show();
?>