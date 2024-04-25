<?php
    $mform = new MForm();
        $mform->addTab('Meta-Informationen');
        $mform->addTextField('1', array('label' => 'Titel'));
        $mform->addTextField('2', array('label' => 'Datum', 'class' => 'datepicker'));
        $mform->addMedialistField('1', array('label' => 'Bild(er)'));
        $mform->closeTab();

        $mform->addTab('Inhalte');
            $mform->addFieldset('Texte');
                $mform->addTextAreaField('3', array('label' => 'Lauftext-Titel'));
                $mform->addTextAreaField('4', array('label' => 'Text (linke Spalte)', 'class' => 'redactor-editor--links_only'));
                $mform->addTextAreaField('5', array('label' => 'Text (rechte Spalte)', 'class' => 'redactor-editor--links_only'));
            $mform->closeFieldset();
            $mform->addFieldset('Read More');
                $mform->addTextField('6', array('label' => '«Read More» Link'));
                $mform->addTextField('7', array('label' => '«Read More» Linktext'));
            $mform->closeFieldset();
        $mform->closeTab();
    echo $mform->show();
?>