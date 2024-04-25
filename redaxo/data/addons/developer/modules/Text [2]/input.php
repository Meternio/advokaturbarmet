<?php
$mform = new MForm();
    $mform->addTab('Text');
        $mform->addTextAreaField('1', array('label' => 'Text', 'class' => 'redactor-editor--links_only'));
    $mform->closeTab();

    $mform->addTab('Download');
        $mform->addTextField('2', array('label' => 'Linktext'));
        $mform->addMediaField('1', array('label' => 'Datei'));
    $mform->closeTab();
echo $mform->show();
?>