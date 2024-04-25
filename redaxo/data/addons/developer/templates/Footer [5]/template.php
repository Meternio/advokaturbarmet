<?php
if ($_COOKIE['cookieAccepted'] === null && $_COOKIE['cookieAll'] === null) {
    echo '
        <div class="cookie__consent hidden">
            <div class="cookie__text">'.rex_global_settings::getValue('cookie_text').'</div>
            <div class="cookie__buttons">
                <div class="accept__all" data-cursor-static>'.rex_global_settings::getValue('cookie_accept_all').'</div>
                <div class="accept__required" data-cursor-static>'.rex_global_settings::getValue('cookie_accept_required').'</div>
            </div>
        </div>      
        ';
    }
?>

<footer>
    <?php
        $FooterArticleContent = new rex_article_content(14);

        $footerCtypes = array(
          'col__1' => $FooterArticleContent->getArticle(1),
          'col__2' => $FooterArticleContent->getArticle(2),
          'col__3' => $FooterArticleContent->getArticle(3),
          'col__4' => $FooterArticleContent->getArticle(4),
        );

        $output = '';
        foreach($footerCtypes as $content) {
            $output .= $content;
        }
        echo $output;
    ?>

    <div class="foot__note">
        <div class="copyright"><?php echo '© '.date('Y').' ADVOKATUR BARMET';?></div>
        <div class="logo">
            <svg xmlns="http://www.w3.org/2000/svg" width="61.009" height="52.97" viewBox="0 0 61.009 52.97"><g transform="translate(-293.815 -414.926)"><rect width="7.126" height="7.525" transform="translate(293.815 462.313) rotate(-45)" fill="#000"/><path d="M354.824,453.485c0,9.036-6.7,14.411-18.149,14.411H310.5V465.17c6.543-.233,7.244-.857,7.244-6.543V424.2c0-5.686-.7-6.31-7.244-6.543v-2.727h24.381c12.464,0,18.773,4.207,18.773,12.62,0,8.258-5.608,12.23-17.526,12.619v.313C349.294,440.633,354.824,444.527,354.824,453.485ZM325.848,418.2v20.33h5.3c9.346,0,13.709-3.271,13.709-10.2,0-6.621-4.05-10.126-11.684-10.126Zm20.174,35.521c0-9.036-3.661-11.218-20.174-11.3v15.189c0,5.064,3.115,7.4,8.8,7.4C341.815,465.015,346.022,460.886,346.022,453.72Z" fill="#000"/></g></svg>
        </div>
        <div class="credits" data-cursor-static data-copyright="<span><?php echo '© '.date('Y').' ADVOKATUR BARMET';?></span><span><a href='mailto:luca@nulltype.ch'>Code: Luca Margadant</a></span>" data-credits="<span><a href='https://www.another-studio.ch' target='_blank' rel='noreferrer'>Design: Another Studio</a></span><span><a href='https://www.leawaser.ch' target='_blank' rel='noreferrer'>Fotografie: Lea Waser</a></span>">Credits</div>
    </div>
</footer>