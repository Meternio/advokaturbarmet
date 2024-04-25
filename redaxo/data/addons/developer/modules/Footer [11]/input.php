<?php
$mform = new MForm();
    $mform->addFieldset('Einstellungen');
    $mform->addSelectField('1', array('auto' => 'Hauptartikel automatisch (ohne Kontakt)', 'manual' => 'Manuell'), array('label' => 'Einstellung', 'class' => 'barmet__footer__select'));
    $mform->closeFieldset();
echo $mform->show();

echo '<div class="barmet__footer--manual">';
$mblockID = '10';
$mblock = new MForm();
    $mblock->addFieldset('Manuelle Verlinkung');
    $mblock->addTextField("$mblockID.0.linkText", array('label' => 'Link Text'));
    $mblock->addLinkField(1, array('label' => 'Interne Verlinkung'));
    $mblock->addMediaField(1, array('label' => 'File Download'));
    $mblock->addTextField("$mblockID.0.internal", array('label' => 'Externe Verlinkung', 'placeholder' => 'Dieses Feld überschreibt das Feld «interne Verlinkung»'));
    $mblock->closeFieldset();
echo Mblock::show($mblockID, $mblock);
echo '</div>';
?>

<script>
    var selectField = document.querySelector('.barmet__footer__select');
    var manualElement = document.querySelector('.barmet__footer--manual');

    var showHide = (show) => {
        console.log(show);
        if(show) {
            manualElement.style.display = 'block';
        } else {
            manualElement.style.display = 'none';
        }
    }

    selectField.addEventListener('change', (e) => {
        if(e.target.value === 'auto') {
            showHide(false);
        } else {
            showHide(true);
        }
    });

    window.setTimeout(() => {
        if(selectField.value === 'auto') {
            showHide(false);
        } else {
            showHide(true);
        }
    },200);
</script>
