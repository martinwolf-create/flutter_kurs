//| **Daten**                                        | **Datentyp**             | **Speicherort**             |
//| ------------------------------------------------ | ------------------------ | --------------------------- |
//| Einzelchat-Nachrichten                           | List<ChatMessage>       | **Server**                  |
//| Gruppenchats                                     | List<GroupChat>         | **Server**                  |
//| Nachrichten in Gruppenchats                      | List<GroupChatMessage>  | **Server**                  |
//| Nutzerprofile inkl. Rolle (Admin/Moderator/User) | List<UserProfile>       | **Server**                  |
//| Rollen je Gruppe                                 | Map<String, String>     | **Server**                  |
//| Mitgliedschaften in Gruppen                      | List<GroupMembership>   | **Server**                  |
//| Freundeslisten                                   | List<Friendship>        | **Server**                  |
//| Posts und Beiträge                               | List<Post>              | **Server**                  |
//| Kommentare zu Beiträgen                          | List<Comment>           | **Server**                  |
//| Veranstaltungen                                  | List<Event>             | **Server**                  |
//| Such-Inserate (Find)                             | List<FindOffer>         | **Server**                  |
//| Suchvorschläge (Suche)                           | List<SearchEntry>       | **Server**                  |
//| Hochgeladene Mediendateien                       | List<MediaFile>         | **Server**                  |
//| Benachrichtigungen                               | List<Notification>      | **Server**                  |
//| Notenscanner-Ergebnisse                          | List<ScannedSheet>      | **Server**                  |
//| Lernfortschritte und Highscores                  | Map<String, dynamic>    | **Server**                  |
//| Blocklisten                                      | List<BlockEntry>        | **Server**                  |
//| Theme-Mode (Dark/Light)                          | bool                    | **Lokal auf Gerät**         |
//| Spracheinstellungen                              | String                  | **Lokal auf Gerät**         |
//| Lokale Caches                                    | Map<String, dynamic>    | **Lokal auf Gerät**         |
//| Zuletzt geöffnete Seiten                         | String                  | **Lokal auf Gerät**         |
//| Auth-Token / Session                             | String                  | **Lokal auf Gerät**         |
//| Push-Benachrichtigungstoken                      | String                  | **Lokal auf Gerät**         |
//| Soundeinstellungen                               | bool                    | **Lokal auf Gerät**         |
//| Persönliche Filtereinstellungen                  | Map<String, dynamic>    | **Lokal auf Gerät**         |
