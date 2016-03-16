Kuchnia pikon
====================

Skrypt pod Windowsa, który umożliwia szybkie tworzenie pikon z plików źródłowych PNG i SVG.<br />
<br />
Do działania potrzebujemy:</br>
1. ImageMagick - najlepiej użyć wersję Q16 static lub portable (http://www.imagemagick.org/script/binary-releases.php)</br>
2. pngquant - narzędzie jest już zawarte w katalogu <strong><em>tools</em></strong></br>
</br>
</br>
<strong>Jak ugotować sobie własne pikony?</strong></br>
<ol>
	<li>W skrypcie <em><strong>Ugotuj_pikony.bat</strong></em> należy wyedytować ścieżkę do ImageMagick <strong>(set MAGICK_PATH="C:\Program Files\ImageMagick-6.9.3-Q16")</strong>.</li>
	<li>Pliki źródłowe z logo nadawców należy wrzucić do katalogu <em><strong>do_ugotowania</strong></em>.</li>
		<ul>
			<li>pliki źródłowe mogą być w formacie SVG lub PNG z przeźroczystym tłem</li>
			<li>pliki źródłowe mogą mieć dowolny rozmiar, jeśli chcemy mieć pikony dobrej jakości to pliki źródłowe powinny mieć rozmiar 220x132px lub większy</li>
			<li>skrypt automatycznie wykrywa puste przestrzenie wokół loga i je przycina</li>
			<li>skrypt automatycznie zmniejsza większe loga do rozmiaru odpowiedniego dla pikon, loga w rozmiarze mniejszym niż 220x132px pozostają bez zmian</li>
		</ul>  
	<li>Do katalogu <em><strong>tlo</strong></em></br> należy wrzucić pliki tłami do pikon w formacie PNG w rozmiarze 220x132px</li>
		<ul>
			<li>skrypt automatycznie rozpoznaje tła i tworzy plikony za każdym rodzajem tła</li>
		</ul>
	<li>Uruchomić skrypt <em><strong>Ugotuj_pikony.bat</strong></em> i czekać na zakończenie działania.</li>
	<li>Ugotowane pikony znajdują się w katalogu <em><strong>ugotowane</strong></em>.</li>
	<li>Plikony będą pogrupowane w katalogach według nazwy tła i głębi kolorów - <em><strong>BigPicon-[nazwa_tła]-32bit/8bit</strong></em>.</li>
</ol>
</br>
</br>
Wszelkie uwagi i sugestmie mile widziane.