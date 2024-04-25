<?php
$mform = new MForm();
$mform->addTextField('1', array('label' => 'Titel', 'placeholder' => 'Darf auch leer gelassen werden'));
$mform->addTextAreaField('2', array('label' => 'Text', 'placeholder' , 'class' => 'redactor-editor--links_with_styles'));
echo $mform->show();
?>