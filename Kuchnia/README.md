Kuchnia pikon
====================

Skrypt pod Windows, który umożliwia szybkie tworzenie pikon z plików źródłowych PNG i SVG.<br />
Tworzy pikony z tłem przeźroczystym lub dowolnym innym.<br />
Pikony są tworzone w głębi kolorów 32bit i 8bit. Wersja 8bit jest optymalizowana przy pomocy narządzia <strong>pngquant</strong>, dzięki czemu zajmuje znacznie mniej miejsca.</br>
<br />
<strong>Do działania potrzebujemy:</br></strong>
<ol>
	<li><strong>ImageMagick</strong> - najlepiej użyć wersję Q16 static lub portable (http://www.imagemagick.org/script/binary-releases.php).</li>
	<li><strong>pngquant</strong> - narzędzie jest już zawarte w katalogu <strong>tools</strong></li>
</ol>
</br>
<strong>Jak ugotować sobie własne pikony?</strong></br>
<ol>
	<li>W skrypcie <strong>Ugotuj_pikony.bat</strong> należy wyedytować ścieżkę do ImageMagick</br><strong>(set MAGICK_PATH="C:\Program Files\ImageMagick-6.9.3-Q16")</strong>.</li>
	<li>Pliki źródłowe z logo nadawców należy wrzucić do katalogu <strong>do_ugotowania</strong>.</li>
		<ul>
			<li>pliki źródłowe mogą być w formacie SVG lub PNG z przeźroczystym tłem</li>
			<li>pliki źródłowe mogą mieć dowolny rozmiar, jeśli chcemy mieć pikony dobrej jakości to pliki źródłowe powinny mieć rozmiar 220x132px lub większy</li>
			<li>skrypt automatycznie wykrywa puste przestrzenie wokół loga i je przycina</li>
			<li>skrypt automatycznie zmniejsza większe loga do rozmiaru odpowiedniego dla pikon, loga w rozmiarze mniejszym niż 220x132px pozostają bez zmian</li>
		</ul>  
	<li>Do katalogu <strong>tlo</strong> należy wrzucić pliki tłami do pikon w formacie PNG w rozmiarze 220x132px</li>
		<ul>
			<li>skrypt automatycznie rozpoznaje tła i tworzy plikony za każdym rodzajem tła</li>
		</ul>
	<li>Uruchomić skrypt <strong>Ugotuj_pikony.bat</strong> i czekać na zakończenie działania.</li>
	<li>Ugotowane pikony znajdują się w katalogu <strong>ugotowane</strong>.</li>
	<li>Plikony będą pogrupowane w katalogach według nazwy tła i głębi kolorów - <strong>BigPicon-[nazwa_tła]-32bit/8bit</strong>.</li>
</ol>
Wszelkie uwagi i sugestmie mile widziane.