<?php
$mblockID = '1';

$mblock = new Mform();
    $mblock->addFieldset('Kompetenz');
        $mblock->addTab('Kachel');
            $mblock->addTextField("$mblockID.0.tileText", array('label' => 'Kacheltext'));
        $mblock->closeTab();

        $mblock->addTab('Popup-Inhalt');
            $mblock->addMediaField("$mblockID.0.REX_MEDIA_1", array('label' => 'Bild'));
            $mblock->addTextField("$mblockID.0.subTitle", array('label' => 'Untertitel'));
            $mblock->addTextAreaField("$mblockID.0.text", array('label' => 'Text', 'class' => 'redactor-editor--links_only'));
            $mblock->addCheckboxField("$mblockID.0.check", array('label' => 'Titel nicht einmitten'));
        $mblock->closeTab();

    $mblock->closeFieldset();
echo MBlock::show($mblockID, $mblock);
?>