echo -e '
<html
  style="
    background-image: url('nyee.jpg');
    height: 100;
    background-repeat: no-repeat;
    background-size: 100% 100%;
    height: 100%;
    width: 100%;
  "
>
  <header>
    <h1 style="text-align: center; color: white">
      lmao ERROR 403 (Forbidden) BRO dari kelompok D06
    </h1>
  </header>
</html>
' >/var/www/parikesit.abimanyu.D06/error/403.html

echo -e '
<html
  style="
    background-image: url('nyee.jpg');
    height: 100;
    background-repeat: no-repeat;
    background-size: 100% 100%;
    height: 100%;
    width: 100%;
  "
>
  <header>
    <h1 style="text-align: center; color: white">
      lmao ERROR 404 (Forbidden) BRO dari kelompok D06
    </h1>
  </header>
</html>
' >/var/www/parikesit.abimanyu.D06/error/404.html

echo "
ErrorDocument 404 /error/404.html
ErrorDocument 403 /error/403.html
" >>/etc/apache2/sites-available/parikesit.abimanyu.D06.com.conf
