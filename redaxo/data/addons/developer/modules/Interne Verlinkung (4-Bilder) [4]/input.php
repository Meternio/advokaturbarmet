<?php
$mform = new MForm();
    $mform->addLinkField('1', array('label' => 'Verlinkung'));
    $mform->addMediaField('1', array('label' => 'Bild 1'));
    $mform->addMediaField('2', array('label' => 'Bild 2'));
    $mform->addMediaField('3', array('label' => 'Bild 3'));
    $mform->addMediaField('4', array('label' => 'Bild 4'));
echo $mform->show();
?>