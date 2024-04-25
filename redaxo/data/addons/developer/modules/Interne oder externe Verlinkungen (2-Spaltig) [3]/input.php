<?php
$mblockID = '1';
$mblock = new MForm();
$mblock->addFieldset('Kachel');
    $mblock->addMediaField("$mblockID.0.REX_MEDIA_1", array('Bild'));
    $mblock->addLinkField("$mblockID.0.REX_LINK_1", array('label' => 'Interne Verlinkung'));
    $mblock->addTextField("$mblockID.0.external", array('label' => 'Externe Verlinkung', 'placeholder' => 'Dieses Feld überschreibt das Feld «interne Verlinkung»'));
    $mblock->addTextField("$mblockID.0.title", array('label' => 'Titel'));
    $mblock->addTextField("$mblockID.0.subtitle", array('label' => 'Untertitel'));
$mblock->closeFieldset();
echo Mblock::show($mblockID, $mblock);
?>