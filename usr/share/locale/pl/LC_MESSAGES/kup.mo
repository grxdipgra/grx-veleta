��    r      �  �   <      �	  �   �	     v
     �
     �
  &   �
     �
               8     L     ^     r     �  +   �     �  D   �  1   #  �   U     �  5   �  �   &  �   �  �  �  ~  ^  �   �  r   ~  u   �  R   g  �   �  e   M  z   �  {   .  |   �  {   '  ,   �  H   �  s        �     �     �     �  Z   �  �   A  T   �  �     �   �     |  '   �  *   �  $   �  *     0   3  "   d  +   �  ?   �  _   �  v   S  I   �  '     +   <  +   h  7   �     �     �     
     )     G     ^     ~  !   �  k   �  f   (   ,   �   2   �      �      �      !     %!     8!     J!     Z!     i!     �!     �!     �!     �!  !   �!     "     "  7   *"     b"  %   y"  %   �"      �"     �"  �   �"  
   �#     �#      �#      $     <$  (   M$     v$  (   �$  +   �$  .   �$  /   %  c   8%     �%  9   �%  5   �%  ,   #&     P&    m&  �   �(     )     �)     �)  !   �)     �)  
   �)     �)     �)     �)     �)     *  
   *  %   *     8*  
   <*     G*  s   N*     �*  7   �*  �   +  �   �+  *  �,  �  �.  �   U1  ]   2  U   }2  =   �2  �   3  ;   �3  v   �3  w   E4  x   �4  ^   65  )   �5  C   �5  >   6     B6     F6     N6     U6     ^6  
   }6     �6     �6     �6     �6  1   �6  -   �6  (   7  '   ?7  ;   g7  0   �7  4   �7  
   	8     8  S   ,8  '   �8     �8  '   �8     �8  6   9     <9     V9     o9     �9  	   �9     �9     �9     �9  p   �9  p   \:  +   �:  "   �:     ;     );     =;     N;  	   c;     m;  	   y;     �;     �;     �;     �;     �;  !   �;     �;     �;  ;   <  !   T<  8   v<  8   �<  &   �<     =    '=     .>     6>  $   V>  -   {>     �>  6   �>     �>  %   ?     -?     4?     N?     W?  "   g?     �?  2   �?     �?     �?     '   G   C   E   e          \   "   A   &       N         d   3       
   0   Y   6   @   S   n   ?   U   4   r   J              j       a          M                      (   ]       #                 b                 =   9          f   >       k           ,   B   _   p          $   q   <      X         8      l                 7              I           m      2          o   +   1   /       V      h       i          %   H   K   c   W           5       P   g         !   .       `   *          )   :       R   [   -   ;       T   L   	   Z   F   Q             ^       D           O            <h2>Backup programs are missing</h2><p>Before you can activate any backup plan you need to install either of</p><ul><li>bup, for versioned backups</li><li>rsync, for synchronized backups</li></ul> @action:buttonAdd New Plan @action:buttonBack @action:buttonBack to overview @action:buttonChoose where to restore @action:buttonClose @action:buttonConfigure @action:buttonNew Folder... @action:buttonNext @action:buttonNo @action:buttonOpen @action:buttonRemove @action:buttonRestore @action:buttonRestore to original location @action:buttonYes @action:button User answers "yes I confirm: overwrite files"Confirm @action:button go to previous page in dialogBack @infoBackups are only taken when manually requested. This can be done by using the popup menu from the backup system tray icon. @infoFile already exists @infoFolder already exists, please choose a solution @infoNew backup will be triggered when backup destination becomes available and more than the configured interval has passed since the last backup was taken. @infoNew backup will be triggered when backup destination becomes available and you have been using your computer actively for more than the configured time limit since the last backup was taken. @infoThis type of backup is a folder which is synchronized with your selected source folders. Taking a backup simply means making the backup destination contain an exact copy of your source folders as they are now and nothing else. If a file has been deleted in a source folder it will get deleted from the backup folder.<nl/>This type of backup can protect you against data loss due to a broken hard drive but it does not help you to recover from your own mistakes. @infoThis type of backup is an <emphasis>archive</emphasis>. It contains both the latest version of your files and earlier backed up versions. Using this type of backup allows you to recover older versions of your files, or files which were deleted on your computer at a later time. The storage space needed is minimized by looking for common parts of your files between versions and only storing those parts once. Nevertheless, the backup archive will keep growing in size as time goes by.<nl/>Also important to know is that the files in the archive can not be accessed directly with a general file manager, a special program is needed. @infoUse this option if you want to backup your files on an external storage that can be plugged in to this computer, such as a USB hard drive or memory stick. @info %1 is the name of the backup plan%1 does not have a destination!<nl/>No backups will be saved by this plan. @info Question to user, in dialogThe following files would be overwritten, please confirm that you wish to continue. @info message bar appearing on topNo destination was selected, please select one. @info message bar appearing on topThe destination does not have enough space available. Please choose a different destination or free some space. @info message bar appearing on topThe new name entered already exists, please enter a different one. @info notificationThe <application>bup</application> program is needed but could not be found, maybe it is not installed? @info notificationThe <application>par2</application> program is needed but could not be found, maybe it is not installed? @info notificationThe <application>rsync</application> program is needed but could not be found, maybe it is not installed? @info:shell Error message at startupYou must supply the path to a bup or git repository that you wish to open for viewing. @info:tooltipOpen dialog to select a folder @info:tooltipThe specified folder will be created if it does not exist. @info:tooltip %1 is the path of the folder in a listview<filename>%1</filename><nl/>will be included in the backup @item:inlistboxDays @item:inlistboxHours @item:inlistboxMinutes @item:inlistboxWeeks @item:inlistbox %1 is drive(partition) label, %2 is storage capacity%1: %2 total capacity @item:inlistbox %1 is filesystem label, %2 is the device description, %3 is either empty or the " (disconnected)" text%1 on %2%3 @item:inlistbox this text is added if selected drive is disconnected (disconnected) @item:inlistbox used for unnamed filesystems, more than one filesystem on device. %1 is partition number, %2 is device description, %3 is either empty or the " (disconnected)" textPartition %1 on %2%3 @item:inlistbox used when there is only one unnamed filesystem on device. %1 is device description, %2 is either empty or the " (disconnected)" text%1%2 @labelDescription: @labelExtra options for advanced users @labelRestoration completed successfully! @labelSelect the backup destination @labelSelect what type of backup you want @labelSelect which folders to include in backup @labelSpecify the backup schedule @labelThis backup plan has never been run. @label %1 is amount of free storage space of hard drive%1 free @label Default name for a new backup plan, %1 is the number of the plan in orderBackup plan %1 @label Only shown if no drives are detectedPlug in the external storage you wish to use, then select it in this list. @label above the detailed error messageAn error occured while restoring: @label:textboxCreate new folder in:
%1 @label:textboxDestination Path for Backup: @label:textboxFolder on Destination Drive: @option:checkAsk for confirmation before taking backup @option:checkBackups Enabled @option:radioActive Usage Time @option:radioExternal Storage @option:radioFilesystem Path @option:radioInterval @option:radioManual Activation @option:radioMerge folders @option:radioSynchronized Backup @option:radioSynchronized Backup (not available because <application>rsync</application> is not installed) @option:radioVersioned Backup (not available because <application>bup</application> is not installed) @option:radioVersioned Backup (recommended) @option:radio Restore the folder under a new name @titleAdvanced @titleBackup Type @titleDestination @titleFile Digger @titleKup Daemon @titleSchedule @titleSources @title:windowNew Folder @title:windowProblem @title:windowRestore Guide @title:windowSelect Folder @title:windowWarning A folder named %1 already exists. Backups Browser for bup archives. Configuration of backup plans for the Kup backup system Configure backup plans Copyright (C) 2011-2015 Simon Persson Copyright (C) 2013-2015 Simon Persson EMAIL OF TRANSLATORSYour emails Kup Configuration Module Kup is a flexible backup solution using the backup storage system 'bup'. This allows it to quickly perform incremental backups, only saving the parts of files that has actually changed since last backup was taken. Maintainer NAME OF TRANSLATORSYour names Name of the branch to be opened. No bup repository found.
%1 Open Destination Path to the bup repository to be opened. Simon Persson You do not have permission to create %1. added after file name in some cases (file) added after file name in some cases (symlink) added after folder name in some cases (folder) added to the suggested filename when restoring, %1 is the time when backup was taken - saved at %1 backup,recovery,safety default folder name when creating a new folderNew Folder notificationInvalid type of backup in configuration. progress report, current operationRestoring progress report, labelFile: Project-Id-Version: kup
Report-Msgid-Bugs-To: http://kde-apps.org/content/show.php/Kup+Backup+System?content=147465
POT-Creation-Date: 2017-05-29 17:49+0800
PO-Revision-Date: 2016-06-11 14:48+0000
Last-Translator: Simon Persson <simon.persson@mykolab.com>
Language-Team: Polish (http://www.transifex.com/kup/kup/language/pl/)
Language: pl
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=3; plural=(n==1 ? 0 : n%10>=2 && n%10<=4 && (n%100<10 || n%100>=20) ? 1 : 2);
 <h2>Nie odnaleziono programów do kopii zapasowych</h2><p>Przed aktywowaniem jakiegokolwiek planu kopii zapasowych musisz zainstalować albo</p><ul><li>bup, do wersjonowanych kopii zapasowych</li><li>rsync, do synchronizowanych kopii zapasowych</li></ul> Dodaj nowy plan Wstecz Wróć do przeglądu Wybierz gdzie chcesz przywrócić Zamknij Konfiguruj Nowy folder... Dalej Nie Otwórz Usuń Przywróć Przywróć do oryginalnej lokalizacji Tak Potwierdź Wstecz Kopie zapasowe są tworzone tylko ręcznie. Można je utworzyć przez menu kontekstowe ikony zasobnika systemowego. Plik już istnieje Folder już istnieje, proszę wybrać inne rozwiązanie Nowa kopia zapasowa zostanie wywołana kiedy miejsce docelowe kopii będzie dostępne i kiedy więcej czasu minie niż w skonfigurowanym interwale od kiedy ostatnia kopia została zrobiona. Nowa kopia zostanie utworzona, gdy lokalizacja docelowa stanie się dostępna, a czas aktywnego użycia komputera od chwili utworzenia ostatniej kopii przekroczy wartość podaną w konfiguracji. Ten typ kopii to folder docelowy synchronizowany z wybranymi folderami źródłowymi. Utworzenie kopii oznacza po prostu przekopiowanie do lokalizacji docelowej dokładnie wszystkich plików zawartych w folderach źródłowych i nic poza tym. Jeśli jakiś plik został usunięty w folderze źródłowym, to po utworzeniu kopii nie będzie go również w folderze docelowym.<nl/>Ten typ kopii zabezpiecza cię przed utratą danych na skutek uszkodzenia dysku twardego, ale nie pomoże ci odzyskać plików utraconych w wyniku twych własnych błędów.   Ten typ kopii to <emphasis>archiwum</emphasis>. Zawiera zarówno ostatnią wersję twoich plików, jak i wersje zachowane poprzednio. Użycie tego typu kopii pozwala na odtworzenie starszych wersji plików bądź też plików usuniętych wcześniej z dysku. Przestrzeń dyskowa potrzebna do zachowania kopii jest minimalizowana poprzez wyszukiwanie w kolejnych wersjach plików ich części wspólnych i zapisywanie tych części tylko raz. Niemniej jednak archiwum będzie z czasem coraz większe.<nl/>Należy również pamiętać, że pliki archiwum tego typu nie będą dostępne bezpośrednio w systemowym menedżerze plików - niezbędny jest specjalny program. Użyj tej opcji jeśli chcesz tworzyć kopie zapasową twoich plików na pamięci zewnętrznej, która może być podłączana do tego komputera, czyli na przykład dysk zewnętrzny lub karta pamięci. %1 nie ma miejsca docelowego!<nl/>Żadna kopia zapasowa nie zostanie zapisana przez ten plan. Następujące pliki zostaną nadpisane, proszę potwierdzić czy chcesz kontynuować. Miejsce docelowe nie zostało wybrane, proszę wybrać jedno. Miejsce docelowe nie posiada wystarczająco wolnego miejsca. Proszę wybrać inne miejsce docelowe lub zwolnić trochę miejsca. Wprowadzona nowa nazwa już istnieje, proszę podać inną. Program <application>bup</application> jest wymagany, ale nie może zostać odnaleziony, może nie jest zainstalowany? Program <application>par2</application> jest wymagany, ale nie może zostać odnaleziony, może nie jest zainstalowany? Program <application>rsync</application> jest wymagany, ale nie może zostać odnaleziony, może nie jest zainstalowany? Musisz podać ścieżkę do repozytorium bup lub git który chcesz otworzyć do wyświetlania. Otwórz okno dialogowe aby wybrać folder Określony folder zostanie stworzony, jeżeli jeszcze nie istnieje. <filename>%1</filename><nl/>zostanie zawarte w kopii zapasowej Dni Godziny Minuty Tygodnie %1: %2 całkowitej pojemności %1 na %2%3 (rozłączono) Partycja %1 na %2%3 %1%2 Opis: Dodatkowe opcje dla zaawansowanych użytkowników Przywracanie zostało zakończone pomyślnie! Wybierz miejsce docelowe kopii zapasowej Wybierz jaki typ kopii zapasowej chcesz Wybierz które foldery mają być zawarte w kopii zapasowej Określ harmonogram wykonywania kopii zapasowych Ten plan kopii zapasowej nigdy nie był uruchomiony. %1 wolnych Plan kopii zapasowej %1 Podłącz pamięć zewnętrzną którą chcesz użyć i wybierz ją na tej liście. Wystąpił błąd podczas przywracania: Utwórz nowy folder w:
%1 Ścieżka docelowa dla kopii zapasowej: Folder na dysku docelowym: Pytaj o potwierdzenie przed wykonaniem kopii zapasowej Kopie zapasowe włączone Czas aktywnego używania Pamięć zewnętrzna Ścieżka systemu plików Interwał Manualna aktywacja Połącz foldery Synchronizowana kopia zapasowa Synchronizowana kopia zapasowa (nie dostępna ponieważ <application>rsync</application> nie jest zainstalowany) Wersjonowana kopia zapasowa (nie jest dostępna ponieważ <application>bup</application> nie jest zainstalowany) Wersjonowana kopia zapasowa (rekomendowane) Przywróć folder pod nową nazwą Zaawansowane Typ kopii zapasowej Miejsce docelowe Wyszukiwarka plików Demon Kup Harmonogram Źródła Nowy Folder Problem Przewodnik przywracania Wybierz folder Ostrzeżenie Folder o nazwie %1 już istnieje. Kopie zapasowe Przeglądarka archiwów bup Konfiguracja planów kopii dla systemu kopii zapasowych Kup Konfiguruj plany kopii zapasowych Wszystkie prawa zastrzeżone (C) 2011-2015 Simon Persson Wszystkie prawa zastrzeżone (C) 2013-2015 Simon Persson marcink96@gmail.com,jbaszkiewicz@o2.pl Moduł konfiguracji Kup Kup jest elastycznym rozwiązaniem tworzenia kopii zapasowych używającym systemu przechowywania kopii 'bup'. Pozwala na szybkie wykonywanie przyrostowych kopii, zapisując tylko części plików które zostały zmienione od ostatniej zrobionej kopii zapasowej. Opiekun Marcin Kralka,Jacek Baszkiewicz Nazwa gałęzi jaka ma być otwarta. Nie odnaleziono żadnego repozytorium bup.
%1 Otwórz miejsce docelowe Ścieżka do repozytorium bup jaka ma zostać otwarta. Simon Persson Nie masz uprawnień aby utworzyć %1. (plik) (dowiązanie symboliczne) (folder) - zapisano w %1 kopia,odzyskiwanie,bezpieczeństwo Nowy Folder Nieprawidłowy typ kopii zapasowej w konfiguracji. Przywracanie Plik: 