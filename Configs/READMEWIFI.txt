You have downloaded Diva's binary distribution of the Wifi addon to
OpenSimulator. Please read LICENSEWIFI.txt before using this addon.

******************************************************************
THIS SOFTWARE IS AVAILABLE AS-IS. THERE ARE NEITHER WARRANTIES
OF IT FUNCTIONING IN YOUR SETUP NOR SUPPORT BEYOND THE INCLUDED
DOCUMENTATION. PLEASE READ THE COMPLETE LICENSE AND MAKE SURE YOU
UNDERSTAND IT. IF THE TERMS OF USE ARE NOT ACCEPTABLE TO YOU, DO
NOT USE THIS SOFTWARE.
******************************************************************

Wifi is a web front-end for OpenSimulator designed for small-to-medium
worlds. This distribution of Wifi targets grid configurations of
OpenSimulator. It is meant to run as a plugin to the Robust server that
you already have.

Note: Wifi is included in the standalone diva distribution of
OpenSimulator (http://github.com/diva/d2/downloads). If you are
running a non-diva standalone world and want to use Wifi, this package
will not be enough. I suggest you use the diva distribution instead,
because it already includes Wifi.

******************************************
***      INSTALLATION INSTRUCTIONS     ***
******************************************

TERMINOLOGY:

- WIFIDIR is the top directory of the Wifi package (this directory).
- ROBUSTDIR is the top opensim directory of your Robust server.

1 - Get your grid up & running. Make sure that you are running a
version of OpenSimulator that is compatible with this addon. The
OpenSimulator version for which this addon was built is stated in the
zip file name. If you have a different version of OpenSimulator, this
pre-built addon may or may not work. 

2 - Place this diva wifi package in the machine where you have your
Robust server running. The simulators have nothing to do with Wifi, so
you don't need to copy this package to those machines.

3 - Copy the entire WIFIDIR/WifiPages directory onto ROBUSTDIR. When
you're done, there should be a ROBUSTDIR/WifiPages directory, in
parallel with ROBUSTDIR/bin.

4 - Copy all files under WIFIDIR/bin onto ROBUSTDIR/bin.

5 - "Merge" WIFIDIR/bin/Wifi.ini.example onto your Robust server's ini
file. In other words, edit your Robust ini file and add the Wifi data
to it. More specifically: 

  a) Under the [ServiceList] section, add
  WifiServerConnector = "8002/Diva.Wifi.dll:WifiServerConnector"

  b) Copy and paste the entire [WifiService] section to your Robust
  ini file and change the values of the configuration variables to fit
  your grid. See doc/WIFI.txt for *important* information about how to
  configure and use Wifi.

  c) Notice the comment under [DatabaseService] in Wifi.ini.example

6 - Shutdown your Robust server and restart it.

7 - Point your Web browser to http://yourdomain:8002/wifi and take it
from there!


------------------------------------------

This distribution is available as-is; there are neither guarantees
nor support beyond the included documentation. 
For issue reports, please use
http://github.com/diva/diva-distribution/issues

*********************************************
*** For news, please follow me on Twitter ***
***    http://twitter.com/divacanto       ***
*********************************************

The diva distro does not maintain email lists or registrations.  If
you want to keep in touch, receive notifications of new releases,
etc., the best way is to follow me on Twitter, or visit my Twitter
page regularly.


Hier ist der Text in Deutsch, Französisch und Spanisch übersetzt:

---

### Deutsch:
Sie haben Divas Binärdistribution des Wifi-Addons für OpenSimulator heruntergeladen. Bitte lesen Sie LICENSEWIFI.txt, bevor Sie dieses Addon verwenden.

******************************************************************
DIESE SOFTWARE WIRD "WIE BESEHEN" BEREITGESTELLT. ES GIBT KEINE
GARANTIEN, DASS SIE IN IHRER UMGEBUNG FUNKTIONIERT, NOCH GIBT ES
UNTERSTÜTZUNG ÜBER DIE BEIGEFÜGTE DOKUMENTATION HINAUS. BITTE LESEN
SIE DIE KOMPLETTE LIZENZ UND STELLEN SIE SICHER, DASS SIE SIE VERSTEHEN.
WENN DIE NUTZUNGSBEDINGUNGEN FÜR SIE NICHT AKZEPTABEL SIND, VERWENDEN
SIE DIESE SOFTWARE NICHT.
******************************************************************

Wifi ist eine Web-Oberfläche für OpenSimulator, die für kleine bis mittlere
Welten entwickelt wurde. Diese Distribution von Wifi richtet sich an Grid-
Konfigurationen von OpenSimulator. Sie soll als Plugin für den Robust-Server
fungieren, den Sie bereits haben.

Hinweis: Wifi ist in der Standalone-Diva-Distribution von OpenSimulator
enthalten (http://github.com/diva/d2/downloads). Wenn Sie eine Nicht-Diva-
Standalone-Welt betreiben und Wifi verwenden möchten, reicht dieses Paket
nicht aus. Ich schlage vor, stattdessen die Diva-Distribution zu verwenden,
da sie Wifi bereits enthält.

******************************************
***      INSTALLATIONSANLEITUNG       ***
******************************************

BEGRIFFE:

- WIFIDIR ist das oberste Verzeichnis des Wifi-Pakets (dieses Verzeichnis).
- ROBUSTDIR ist das oberste OpenSim-Verzeichnis Ihres Robust-Servers.

1 - Starten Sie Ihr Grid und stellen Sie sicher, dass Sie eine
Version von OpenSimulator verwenden, die mit diesem Addon kompatibel ist.
Die OpenSimulator-Version, für die dieses Addon erstellt wurde, ist im
Namen der Zip-Datei angegeben. Wenn Sie eine andere Version von OpenSimulator haben,
kann es sein, dass dieses vorgefertigte Addon funktioniert oder auch nicht.

2 - Platzieren Sie dieses Diva-Wifi-Paket auf dem Computer, auf dem Ihr
Robust-Server läuft. Die Simulatoren haben nichts mit Wifi zu tun, daher müssen
Sie dieses Paket nicht auf diese Maschinen kopieren.

3 - Kopieren Sie das gesamte WIFIDIR/WifiPages-Verzeichnis nach ROBUSTDIR. Wenn
Sie fertig sind, sollte es ein ROBUSTDIR/WifiPages-Verzeichnis geben, das parallel
zu ROBUSTDIR/bin liegt.

4 - Kopieren Sie alle Dateien unter WIFIDIR/bin nach ROBUSTDIR/bin.

5 - "Verschmelzen" Sie WIFIDIR/bin/Wifi.ini.example mit der Ini-Datei Ihres
Robust-Servers. Mit anderen Worten: Bearbeiten Sie Ihre Robust-Ini-Datei und fügen
Sie die Wifi-Daten hinzu. Genauer gesagt:

  a) Fügen Sie im Abschnitt [ServiceList] hinzu:
  WifiServerConnector = "8002/Diva.Wifi.dll:WifiServerConnector"

  b) Kopieren Sie den gesamten Abschnitt [WifiService] in Ihre Robust-Ini-Datei und ändern
  Sie die Werte der Konfigurationsvariablen, um sie an Ihr Grid anzupassen. Siehe doc/WIFI.txt
  für *wichtige* Informationen zur Konfiguration und Nutzung von Wifi.

  c) Beachten Sie den Kommentar unter [DatabaseService] in Wifi.ini.example.

6 - Fahren Sie Ihren Robust-Server herunter und starten Sie ihn neu.

7 - Rufen Sie in Ihrem Webbrowser http://IhrDomain:8002/wifi auf und folgen Sie den Anweisungen!


------------------------------------------

Diese Distribution wird "wie gesehen" bereitgestellt; es gibt weder Garantien
noch Unterstützung über die enthaltene Dokumentation hinaus.
Für Fehlerberichte verwenden Sie bitte:
http://github.com/diva/diva-distribution/issues

*********************************************
*** Für Neuigkeiten folgen Sie mir bitte auf Twitter ***
***    http://twitter.com/divacanto          ***
*********************************************

Die Diva-Distribution unterhält keine E-Mail-Listen oder Registrierungen. Wenn
Sie in Kontakt bleiben, Benachrichtigungen über neue Versionen erhalten usw.
möchten, ist der beste Weg, mir auf Twitter zu folgen oder regelmäßig meine
Twitter-Seite zu besuchen.

---

### Französisch:
Vous avez téléchargé la distribution binaire de l'addon Wifi de Diva pour
OpenSimulator. Veuillez lire LICENSEWIFI.txt avant d'utiliser cet addon.

******************************************************************
CE LOGICIEL EST DISPONIBLE TEL QUEL. IL N'Y A AUCUNE GARANTIE QUANT 
À SON FONCTIONNEMENT DANS VOTRE CONFIGURATION, NI DE SUPPORT AU-DELÀ 
DE LA DOCUMENTATION INCLUSE. VEUILLEZ LIRE LA LICENCE COMPLÈTE ET 
VOUS ASSURER DE LA COMPRENDRE. SI LES CONDITIONS D'UTILISATION NE 
VOUS CONVIENNENT PAS, N'UTILISEZ PAS CE LOGICIEL.
******************************************************************

Wifi est une interface web pour OpenSimulator conçue pour les mondes de petite à 
moyenne taille. Cette distribution de Wifi est destinée aux configurations de 
grille d'OpenSimulator. Elle est conçue pour fonctionner en tant que plugin 
pour le serveur Robust que vous avez déjà.

Remarque : Wifi est inclus dans la distribution autonome Diva d'OpenSimulator
(http://github.com/diva/d2/downloads). Si vous utilisez un monde autonome non 
Diva et souhaitez utiliser Wifi, ce package ne suffira pas. Je vous suggère 
d'utiliser plutôt la distribution Diva, car elle inclut déjà Wifi.

******************************************
***      INSTRUCTIONS D'INSTALLATION  ***
******************************************

TERMINOLOGIE :

- WIFIDIR est le répertoire supérieur du package Wifi (ce répertoire).
- ROBUSTDIR est le répertoire supérieur d'OpenSim de votre serveur Robust.

1 - Lancez votre grille et assurez-vous que vous exécutez une version d'OpenSimulator 
compatible avec cet addon. La version d'OpenSimulator pour laquelle cet addon a été 
construit est indiquée dans le nom du fichier zip. Si vous avez une version différente 
d'OpenSimulator, cet addon pré-construit peut ou non fonctionner.

2 - Placez ce package Diva Wifi sur la machine où vous exécutez votre serveur Robust. 
Les simulateurs n'ont rien à voir avec Wifi, vous n'avez donc pas besoin de copier ce 
package sur ces machines.

3 - Copiez l'intégralité du répertoire WIFIDIR/WifiPages dans ROBUSTDIR. Une fois 
terminé, il devrait y avoir un répertoire ROBUSTDIR/WifiPages, en parallèle avec ROBUSTDIR/bin.

4 - Copiez tous les fichiers sous WIFIDIR/bin dans ROBUSTDIR/bin.

5 - "Fusionnez" WIFIDIR/bin/Wifi.ini.example avec le fichier ini de votre serveur 
Robust. En d'autres termes, éditez votre fichier ini de Robust et ajoutez les données 
de Wifi. Plus précisément:

  a) Dans la section [ServiceList], ajoutez :
  WifiServerConnector = "8002/Diva.Wifi.dll:WifiServerConnector"

  b) Copiez et collez la section entière [WifiService] dans votre fichier ini de Robust 
  et modifiez les valeurs des variables de configuration pour les adapter à votre grille. 
  Consultez doc/WIFI.txt pour des informations *importantes* sur la configuration et 
  l'utilisation de Wifi.

  c) Remarquez le commentaire sous [DatabaseService] dans Wifi.ini.example.

6 - Arrêtez votre serveur Robust et redémarrez-le.

7 - Pointez votre navigateur Web vers http://votredomaine:8002/wifi et suivez les instructions!


------------------------------------------

Cette distribution est disponible telle quelle ; il n'y a ni garanties 
ni support au-delà de la documentation incluse.
Pour signaler un problème, veuillez utiliser :
http://github.com/diva/diva-distribution/issues

*********************************************
*** Pour des nouvelles, suivez-moi sur Twitter ***
***    http://twitter.com/divacanto          ***
*********************************************

La distribution Diva ne maintient pas de listes de diffusion ni d'inscriptions. Si vous 
souhaitez rester en contact, recevoir des notifications de nouvelles versions, etc., 
le meilleur moyen est de me suivre sur Twitter ou de visiter régulièrement ma page Twitter.

---

### Spanisch:
Ha descargado la distribución binaria del complemento Wifi de Diva para
OpenSimulator. Lea LICENSEWIFI.txt antes de usar este complemento.

******************************************************************
ESTE SOFTWARE ESTÁ DISPONIBLE TAL COMO ESTÁ. NO HAY GARANTÍAS 
DE QUE FUNCIONE EN SU CONFIGURACIÓN NI SOPORTE MÁS ALLÁ DE LA 
DOCUMENTACIÓN INCLUIDA. LEA COMPLETAMENTE LA LICENCIA Y ASEGÚRESE 
DE ENTENDERLA. SI LOS TÉRMINOS DE USO NO SON ACEPTABLES PARA USTED, 
NO UTILICE ESTE SOFTWARE.
******************************************************************

Wifi es una interfaz web para OpenSimulator diseñada para mundos de tamaño pequeño
a mediano. Esta distribución de Wifi está dirigida a configuraciones de rejilla de
OpenSimulator. Está diseñada para funcionar como un complemento para el servidor
Robust que ya tiene.

Nota: Wifi está incluido en la distribución independiente de Diva para
OpenSimulator (http://github.com/diva/d2/downloads). Si está ejecutando un mundo
independiente no-Diva y desea usar Wifi, este paquete no será suficiente.