<?php
$mform = new MForm();
$mform->addMedialistField('1', array('Bilder'));
$mform->addTextField('1', array('Titel'));
echo $mform->show();
?>