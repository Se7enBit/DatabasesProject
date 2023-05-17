#School Inserts
INSERT INTO school (appellation, city, postcode, phone_number, email, principal) VALUES ('Lincoln High School', 'San Francisco', '94122', '4155551234', 'lincolnhighsf@example.com', 'John Hamm');
INSERT INTO school (appellation, city, postcode, phone_number, email, principal) VALUES ('Hillside Elementary School', 'Los Angeles', '90001', '3235556789', 'hillsideelem@example.com', 'Nicolas Cage');
INSERT INTO school (appellation, city, postcode, phone_number, email, principal) VALUES ('Central Middle School', 'Chicago', '60601', '3125559876', 'centralmiddlechicago@example.com', 'John Travolta');
INSERT INTO school (appellation, city, postcode, phone_number, email, principal) VALUES ('Meadowview High School', 'Houston', '77002', '7135554321', 'meadowviewhs@example.com', 'Tom Cruise');
INSERT INTO school (appellation, city, postcode, phone_number, email, principal) VALUES ('Northside Elementary School', 'New York', '10001', '2125557890', 'northsideelemny@example.com', 'Jeniffer Aniston');

#General Admin
INSERT INTO app_user (first_name, last_name, birthdate, user_role, is_active, username, userpassword) VALUES ('John', 'Papachristou', '1995-01-18', 'general_admin', '1', 'general.admin', 'tfutfu765fujh*(&');

#School Admins
INSERT INTO app_user (first_name, last_name, birthdate, school, user_role, is_active, username, userpassword) VALUES ('Peter', 'MacJohnson', '1995-01-18', '1', 'school_admin', '1', 'school_admin1', 'tfutfu765fujh*(&');
INSERT INTO app_user (first_name, last_name, birthdate, school, user_role, is_active, username, userpassword) VALUES ('Stella', 'MacArtney', '1995-01-18', '2', 'school_admin', '1', 'school_admin2', 'tfutfu765fujh*(&');
INSERT INTO app_user (first_name, last_name, birthdate, school, user_role, is_active, username, userpassword) VALUES ('Tom', 'MacArthur', '1995-01-18', '3', 'school_admin', '1', 'school_admin3', 'tfutfu765fujh*(&');
INSERT INTO app_user (first_name, last_name, birthdate, school, user_role, is_active, username, userpassword) VALUES ('Timothy', 'MacDonald', '1995-01-18', '4', 'school_admin', '1', 'school_admin4', 'tfutfu765fujh*(&');
INSERT INTO app_user (first_name, last_name, birthdate, school, user_role, is_active, username, userpassword) VALUES ('Theodor', 'MacGreg', '1995-01-18', '5', 'school_admin', '1', 'school_admin5', 'tfutfu765fujh*(&');

#Students
INSERT INTO app_user (first_name, last_name, birthdate, school, user_role, is_active, username, userpassword) 
VALUES ('Emma', 'Johnson', '2005-02-10', 2, 'student', 1, 'emma.johnson', 'Emma@1234'),
        ('Michael', 'Smith', '2006-05-22', 4, 'student', 1, 'michael.smith', 'Michael@1234'),
        ('Ella', 'Davis', '2003-12-15', 1, 'student', 1, 'ella.davis', 'Ella@1234'),
        ('Noah', 'Williams', '2004-08-02', 3, 'student', 1, 'noah.williams', 'Noah@1234'),
        ('Avery', 'Brown', '2006-03-20', 5, 'student', 1, 'avery.brown', 'Avery@1234'),
        ('Olivia', 'Garcia', '2004-11-12', 1, 'student', 1, 'olivia.garcia', 'Olivia@1234'),
        ('Ethan', 'Martinez', '2005-07-07', 2, 'student', 1, 'ethan.martinez', 'Ethan@1234'),
        ('Sophia', 'Lee', '2004-01-18', 4, 'student', 1, 'sophia.lee', 'Sophia@1234'),
        ('Lucas', 'Rodriguez', '2006-06-30', 3, 'student', 1, 'lucas.rodriguez', 'Lucas@1234'),
        ('Chloe', 'Wilson', '2005-03-25', 2, 'student', 1, 'chloe.wilson', 'Chloe@1234'),
        ('Mason', 'Anderson', '2006-09-08', 5, 'student', 1, 'mason.anderson', 'Mason@1234'),
        ('Aaliyah', 'Thomas', '2003-10-17', 1, 'student', 1, 'aaliyah.thomas', 'Aaliyah@1234'),
        ('Liam', 'Jackson', '2004-12-27', 4, 'student', 1, 'liam.jackson', 'Liam@1234'),
        ('Ava', 'White', '2006-04-05', 3, 'student', 1, 'ava.white', 'Ava@1234'),
        ('Elijah', 'Harris', '2004-02-28', 2, 'student', 1, 'elijah.harris', 'Elijah@1234'),
        ('Isabella', 'Martin', '2005-08-14', 5, 'student', 1, 'isabella.martin', 'Isabella@1234'),
        ('Alexander', 'Thompson', '2006-01-09', 1, 'student', 1, 'alexander.thompson', 'Alexander@1234'),
        ('Madison', 'Moore', '2003-11-21', 4, 'student', 1, 'madison.moore', 'Madison@1234'),
        ('Samantha', 'Clark', '2004-04-14', 1, 'student', 1, 'samantha.clark', 'Samantha@1234'),
        ('Daniel', 'Allen', '2006-02-28', 5, 'student', 1, 'daniel.allen', 'Daniel@1234'),
        ('Natalie', 'Hall', '2003-09-23', 3, 'student', 1, 'natalie.hall', 'Natalie@1234'),
        ('Carter', 'Young', '2005-07-31', 2, 'student', 1, 'carter.young', 'Carter@1234'),
        ('Evelyn', 'King', '2004-11-04', 4, 'student', 1, 'evelyn.king', 'Evelyn@1234'),
        ('William', 'Wright', '2006-01-18', 1, 'student', 1, 'william.wright', 'William@1234'),
        ('Amelia', 'Scott', '2003-12-09', 5, 'student', 1, 'amelia.scott', 'Amelia@1234'),
        ('Jayden', 'Baker', '2005-09-03', 2, 'student', 1, 'jayden.baker', 'Jayden@1234'),
        ('Avery', 'Nelson', '2004-02-11', 3, 'student', 1, 'avery.nelson', 'Avery@1234'),
        ('Aria', 'Carter', '2006-06-22', 4, 'student', 1, 'aria.carter', 'Aria@1234'),
        ('Logan', 'Mitchell', '2003-10-25', 1, 'student', 1, 'logan.mitchell', 'Logan@1234'),
        ('Sofia', 'Parker', '2004-07-12', 5, 'student', 1, 'sofia.parker', 'Sofia@1234'),
        ('Ryan', 'Evans', '2006-03-08', 2, 'student', 1, 'ryan.evans', 'Ryan@1234'),
        ('Victoria', 'Edwards', '2005-05-19', 3, 'student', 1, 'victoria.edwards', 'Victoria@1234'),
        ('Jackson', 'Collins', '2004-09-16', 4, 'student', 1, 'jackson.collins', 'Jackson@1234'),
        ('Isabella', 'Gonzalez', '2003-06-05', 1, 'student', 1, 'isabella.gonzalez', 'Isabella@1234'),
        ('Oliver', 'Roberts', '2005-12-18', 5, 'student', 1, 'oliver.roberts', 'Oliver@1234'),
        ('Ethan', 'Hill', '2004-04-29', 3, 'student', 1, 'ethan.hill', 'Ethan@1234'),
        ('Sophie', 'Green', '2006-08-12', 2, 'student', 1, 'sophie.green', 'Sophie@1234'),
        ('Mia', 'Barnes', '2003-07-01', 4, 'student', 1, 'mia.barnes', 'Mia@1234'),
        ('Noah', 'Coleman', '2005-09-26', 1, 'student', 1, 'noah.coleman', 'Noah@1234'),
        ('Aaliyah', 'Taylor', '2004-02-13', 5, 'student', 1, 'aaliyah.taylor', 'Aaliyah@1234'),
        ('Liam', 'Henderson', '2006-05-08', 2, 'student', 1, 'liam.henderson', 'Liam@1234'),
        ('Madison', 'Russell', '2003-12-24', 3, 'student', 1, 'madison.russell', 'Madison@1234'),
        ('Elijah', 'Ramirez', '2006-07-16', 4, 'student', 1, 'elijah.ramirez', 'Elijah@1234'),
        ('Harper', 'Simpson', '2004-09-10', 1, 'student', 1, 'harper.simpson', 'Harper@1234'),
        ('Charlotte', 'Reed', '2005-01-31', 5, 'student', 1, 'charlotte.reed', 'Charlotte@1234'),
        ('Alexander', 'Cook', '2004-03-15', 2, 'student', 1, 'alexander.cook', 'Alexander@1234'),
        ('Samantha', 'Cooper', '2006-06-20', 3, 'student', 1, 'samantha.cooper', 'Samantha@1234'),
        ('Benjamin', 'Bailey', '2003-10-17', 4, 'student', 1, 'benjamin.bailey', 'Benjamin@1234');

#Teachers
INSERT INTO app_user (first_name, last_name, birthdate, school, user_role, is_active, username, userpassword) 
VALUES ('Julia', 'Taylor', '1991-04-12', 1, 'teacher', 1, 'julia.taylor', 'Julia@1234'),
        ('Nathan', 'Garcia', '1987-11-25', 5, 'teacher', 1, 'nathan.garcia', 'Nathan@1234'),
        ('Amanda', 'Jones', '1990-07-18', 3, 'teacher', 1, 'amanda.jones', 'Amanda@1234'),
        ('David', 'Rodriguez', '1988-02-07', 2, 'teacher', 1, 'david.rodriguez', 'David@1234'),
        ('Emily', 'Martinez', '1985-09-01', 4, 'teacher', 1, 'emily.martinez', 'Emily@1234'),
        ('Daniel', 'Rivera', '1986-12-24', 1, 'teacher', 1, 'daniel.rivera', 'Daniel@1234'),
        ('Lauren', 'Wright', '1989-05-16', 5, 'teacher', 1, 'lauren.wright', 'Lauren@1234'),
        ('Michael', 'Lee', '1987-08-28', 2, 'teacher', 1, 'michael.lee', 'Michael@1234'),
        ('Rachel', 'Perez', '1986-01-10', 3, 'teacher', 1, 'rachel.perez', 'Rachel@1234'),
        ('William', 'Johnson', '1985-03-07', 4, 'teacher', 1, 'william.johnson', 'William@1234'),
        ('Katherine', 'Gonzalez', '1988-09-05', 1, 'teacher', 1, 'katherine.gonzalez', 'Katherine@1234'),
        ('Eric', 'Baker', '1990-11-12', 5, 'teacher', 1, 'eric.baker', 'Eric@1234'),
        ('Olivia', 'Davis', '1986-06-20', 2, 'teacher', 1, 'olivia.davis', 'Olivia@1234'),
        ('Joshua', 'White', '1989-03-15', 3, 'teacher', 1, 'joshua.white', 'Joshua@1234'),
        ('Sarah', 'Smith', '1985-12-31', 4, 'teacher', 1, 'sarah.smith', 'Sarah@1234'),
        ('Melanie', 'Jones', '1990-10-05', 2, 'teacher', 1, 'melanie.jones', 'Melanie@1234'),
        ('Thomas', 'Nguyen', '1985-07-23', 1, 'teacher', 1, 'thomas.nguyen', 'Thomas@1234'),
        ('Jessica', 'Kim', '1986-04-15', 3, 'teacher', 1, 'jessica.kim', 'Jessica@1234'),
        ('Christopher', 'Davis', '1988-12-07', 4, 'teacher', 1, 'christopher.davis', 'Christopher@1234'),
        ('Karen', 'Wilson', '1985-11-02', 5, 'teacher', 1, 'karen.wilson', 'Karen@1234');

#Books
INSERT INTO book (title, publisher, isbn, number_of_pages, category, abstract, image, keywords)
VALUES ('ΥΠΟΛΟΓΙΣΤΙΚΗ ΝΕΦΟΥΣ', 'ΚΛΕΙΔΑΡΙΘΜΟΣ', '978-960-645-376-2', '352', 'health,literature,thriller', 'Στο νέο του βιβλίο, που έχει ήδη ενταχθεί με επιτυχία στα πανεπιστήμια, ο κορυφαίος συγγραφέας Douglas E. Comer εισάγει τους αναγνώστες μεθοδικά και διεξοδικά στην υπολογιστική νέφους (cloud computing). Το βιβλίο Υπολογιστική νέφους: Το μέλλον της υπολογιστικής επικεντρώνεται στις... Περισσότερες Πληροφορίες', 'images/0.png','Control Engineering'),
        ('ΤΕΧΝΙΚΟΣ ΔΙΚΤΥΩΝ ΥΠΟΛΟΓΙΣΤΩΝ', '24 ΓΡΑΜΜΑΤΑ', '978-618-2016-008', '190', 'autobiography,literature,comic,drama,children’s,romance,contemporary,art', '', 'images/1.png','Operating Systems'),
        ('ΕΓΧΕΙΡΙΔΙΟ ΤΕΧΝΗΤΗΣ ΝΟΗΜΟΣΥΝΗΣ', 'ΓΚΙΟΥΡΔΑΣ Μ.', '978-960-512-755-8', '484', 'history,math', 'Το παρόν βιβλίο καλύπτει τον ευρύτερο τομέα της τεχνητής νοημοσύνης. Τα κεφάλαια του βιβλίου εκτείνονται σε τρεις κατηγορίες:1.    Μέθοδοι συνεπαγωγικής συλλογιστικής:Αυτές οι μέθοδοι ξεκινούν με προκαθορισμένες υποθέσεις και συλλογίζονται με αυτές προκειμένου να... Περισσότερες Πληροφορίες', 'images/2.png','Operating Systems'),
        ('C ΠΡΟΓΡΑΜΜΑΤΙΣΜΟΣ 9Η ΕΚΔΟΣΗ', 'ΓΚΙΟΥΡΔΑΣ Μ.', '978-9605127541', '802', 'technology,contemporary,history,poetry,comedy,romance,classic,adventure,comic', 'C Προγραμματισμός, 9η Έκδοση με Μελέτες Περιπτώσεων για Προγραμματισμό Εφαρμογών και Προγραμματισμό ΣυστημάτωνΕκατομμύρια άνθρωποι σε όλο τον κόσμο έχουν μάθει προγραμματισμό με τα βιβλία, τα ηλεκτρονικά βιβλία, τα προϊόντα διαδραστικών μέσων και τους άλλους... Περισσότερες Πληροφορίες', 'images/3.png','Artificial Neural Networks,Computer Ethics,Artificial Intelligence,Internet of Things,Web Development'),
        ('ΕΓΧΕΙΡΙΔΙΟ ΕΛΕΓΧΟΥ ΠΛΗΡΟΦΟΡΙΚΗΣ', 'ΕΚΔΟΣΕΙΣ ΦΥΛΑΤΟΣ', '978-960-658-172-4', '284', 'engineering,children’s,classic,history,comic,adventure', 'Γιατί χρειάζεται να διαβάσει κάποιος το βιβλίο; (1) Για να είναι σε θέση ο ελεγκτής πληροφορικής, ή ο εσωτερικός ελεγκτής ή και στελέχη πληροφορικής να επισκοπήσουν και να αξιολογήσουν τα υπάρχοντα μέτρα διακυβέρνησης πληροφορικής (πολιτικές, διαδικασίες, πρακτικές, κλπ.),... Περισσότερες Πληροφορίες', 'images/4.png','Formal Methods,Operating Systems,Internet of Things,Electronics'),
        ('ΕΙΣΑΓΩΓΗ ΣΤΟ AUTOCAD 2023', 'ΚΛΕΙΔΑΡΙΘΜΟΣ', '978-960-645-347-2', '540', 'science,biography,health,travel,mystery,classic,management,education,poetry', 'Ανεξάρτητα από το αν είστε νέος χρήστης και κάνετε τώρα το ξεκίνημά σας στη σχεδίαση με το AutoCAD ή πεπειραμένος χρήστης και έχετε δυσκολευτεί με άλλα βοηθήματα χωρίς να έχετε ξεκαθαρίσει τη λογική της ηλεκτρονικής σχεδίασης, σε αυτό το βιβλίο θα βρείτε:    Τη βοήθεια που... Περισσότερες Πληροφορίες', 'images/5.png','Deep Learning,Neural Networks,Network Security,Expert Systems,Pattern Recognition,Game Development,Computer Programming,Computer Security'),
        ('ΕΝΑ ΤΕΛΕΙΟ POST', 'ΠΕΔΙΟ', '978-960-635-536-3', '272', 'psychology', '«Χρονογράφος της ψηφιακής κουλτούρας», η Βάλια Καϊμάκη, Επίκουρη Καθηγήτρια στο Ιόνιο Πανεπιστήμιο, αρθρογραφεί από το 2003 για την τεχνολογία, το διαδίκτυο και τα social media, ενώ ήδη από το 1998 είχε ξεκινήσει εκπομπές με την ίδια θεματολογία στο Πρώτο Πρόγραμμα της ΕΡΤ. Στα... Περισσότερες Πληροφορίες', 'images/6.png','Neural Networks,Database Systems,Cryptography'),
        ('AMAZON KINDLE ΕΓΧΕΙΡΙΔΙΟ ΧΡΗΣΗΣ', 'BOOKGURU.GR', '978-618-5676-10-0', '32', 'poetry,contemporary,romance,children’s', ' Η Amazon είναι ο πιο γρήγορος τρόπος για να εκδώσετε το βιβλίο σου στο εξωτερικό, εύκολα, γρήγορα, απλά και προπάντων ΔΩΡΕΑΝ, αρκεί να ξέρετε πώς να το κάνετε. To παρόν εγχειρίδιο είναι ένας step-by-step οδηγός που βοηθάει και κατευθύνει τα βήματα των συγγραφέων, προκειμένου να... Περισσότερες Πληροφορίες', 'images/7.png','Data Mining,Electronics,Pattern Recognition,Information Retrieval,Parallel Computing,Deep Learning,Formal Methods'),
        ('ΟΔΗΓΟΣ ΚΑΙ ΕΦΑΡΜΟΓΕΣ ΛΟΓΙΣΤΙΚΩΝ ΦΥΛΛΩΝ ΜΕ ΤΟ MS EXCEL 3η ΕΚΔΟΣΗ', 'ΔΙΣΙΓΜΑ ΕΚΔΟΣΕΙΣ', '978-618-202-114-9', '610', 'finance,history,thriller,technology,fantasy,poetry,autobiography,engineering', ' Το παρόν βιβλίο αποτελεί έναν φιλικό οδηγό, που έχει σκοπό να σας βοηθήσει να μάθετε να χρησιμοποιείτε την εφαρμογή Excel του Ελληνικού Microsoft Office 365 και να γνωρίσετε τις δυνατότητες που περιλαμβάνονται στο πρόγραμμα αυτό. Η ύλη του βιβλίου παρουσιάζεται με αναλυτικά... Περισσότερες Πληροφορίες', 'images/8.png','Database Systems,Artificial Intelligence,Artificial Neural Networks,Neural Networks,Neuroscience'),
        ('ΒΑΣΕΙΣ ΔΕΔΟΜΕΝΩΝ ΚΑΙ ΠΟΛΥΜΕΣΑ ΣΤΗΝ ΥΓΕΙΑ', 'ΠΑΣΧΑΛΙΔΗΣ', '978-960-489-304-1', '344', 'autobiography,education,health,Greek literature,engineering,fantasy', 'Στον 21ο αιώνα όπου οι φοιτητές και οι λειτουργοί Υγείας είναι ήδη εξοικειωμένοι με τις βασικές αρχές των Τεχνολογιών Πληροφορικής, το παρόν σύγγραμμα στοχεύει σε περαιτέρω εκπαίδευσή τους στις Βάσεις Δεδομένων και στα Πολυμέσα, ως βασικές κατηγορίες εφαρμογών των νέων... Περισσότερες Πληροφορίες', 'images/9.png','Mathematical Modeling,High Performance Computing,Computational Science,Computer Science,Deep Learning,Machine Vision,Finite Element Analysis'),
        ('ΝΑ ΕΝΑ ANDROID', 'ΠΑΠΑΖΗΣΗΣ', '978-960-02-3971-3', '310', 'drama,autobiography,Greek literature,fantasy,thriller', 'Το παρόν βιβλίο δίνει στον αναγνώστη, με απλό, δομημένο και επεξηγηματικό τρόπο, σε μορφή αυτοεκμάθησης και χωρίς απαίτηση προγενέστερων γνώσεων ή εξειδικευμένων δεξιοτήτων επί του αντικειμένου, την δυνατότητα να αναπτύξει την οποιαδήποτε εφαρμογή που καλύπτει γενικές... Περισσότερες Πληροφορίες', 'images/10.png','Finite Element Analysis,Mathematical Modeling,Operating Systems,Deep Learning,Neural Networks,Natural Language Processing'),
        ('ΠΡΟΓΡΑΜΜΑΤΙΣΜΟΣ PYTHON Γ ΕΠΑΛ ΘΕΩΡΙΑ 354 ΛΥΜΕΝΕΣ', 'ΔΡΑΚΟΠΟΥΛΟΣ ΑΝΑΣΤΑΣΙΟΣ', '978-618-84987-3-0', '589', 'fantasy,engineering,drama,science,children’s,romance,health,technology,travel', '', 'images/11.png','Digital Signal Processing,Computer Networks,Data Science,Internet of Things,Big Data,Cybersecurity'),
        ('ΠΡΟΓΡΑΜΜΑΤΙΣΜΟΣ PYTHON Γ ΕΠΑΛ 354 ΛΥΜΕΝΕΣ ΑΣΚΗΣΕΙΣ', 'ΔΡΑΚΟΠΟΥΛΟΣ ΑΝΑΣΤΑΣΙΟΣ', '978-618-84987-4-7', '331', 'art,history,fantasy,poetry,technology,romance,science,adventure,drama', 'Το βιβλίο αυτό απευθύνεται στους μαθητές Γ ΕΠΑΛ του τομέα Πληροφορικής. Καλύπτει τόσο τον δομημένο όσο και τον αντικειμενοστραφή προγραμματισμό δίνοντας ιδιαίτερη έμφαση στην κατανόηση των συναρτήσεων. Στο βιβλίο αυτό υπάρχουν 354 λυμένες ασκήσεις υποδειγματικά... Περισσότερες Πληροφορίες', 'images/12.png','Information Science,Simulation and Modeling,Expert Systems,Cybersecurity,Deep Learning,Database Systems,Virtual Reality,Parallel Computing,Database Management'),
        ('ΠΡΟΓΡΑΜΜΑΤΙΣΜΟΣ PYTHON Γ ΕΠΑΛ ΘΕΩΡΙΑ ΠΑΡΑΔΕΙΓΜΑΤΑ', 'ΔΡΑΚΟΠΟΥΛΟΣ ΑΝΑΣΤΑΣΙΟΣ', '978-618-84987-5-4', '268', 'engineering,adventure,drama,romance', 'Το βιβλίο αυτό απευθύνεται στους μαθητές Γ ΕΠΑΛ του τομέα Πληροφορικής. Καλύπτει τόσο τον δομημένο όσο και τον αντικειμενοστραφή προγραμματισμό δίνοντας ιδιαίτερη έμφαση στην κατανόηση των συναρτήσεων παρέχοντας περισσότερα από 140 παραδείγματα υλοποίησης συναρτήσεων... Περισσότερες Πληροφορίες', 'images/13.png','Computer Programming,Artificial Neural Networks,Statistical Analysis,Programming Languages,Artificial Intelligence,Web Development'),
        ('BLACK MIRROR', 'ΚΑΣΤΑΝΙΩΤΗΣ', '978-960-03-7052-2', '464', 'adventure,art,science fiction,classic', 'Μπορεί μια σειρά επιστημονικής φαντασίας να ρίξει φως σε άγνωστες ή αφανείς πτυχές του τεχνοπολιτισμού του 21ου αιώνα; Πώς λειτουργεί στον θεατή η επαφή με μια ιστορία «εκτός πραγματικότητας», η οποία όμως ταυτόχρονα φαντάζει υπερβολικά «οικεία»; Στη δημοφιλή σειρά Black... Περισσότερες Πληροφορίες', 'images/14.png','Computer Science,Computer Vision,Simulation and Modeling,Software Engineering'),
        ('ΚΥΒΕΡΝΟΑΣΦΑΛΕΙΑ ΚΑΙ ΚΥΒΕΡΝΟΠΟΛΕΜΟΣ', 'ΠΑΡΙΣΙΑΝΟΥ', '978-960-583-550-7', '364', 'poetry,romance,technology,crime,management,Greek literature,history,health,thriller', 'Κάθε τομέας της σύγχρονης ζωής, από την επικοινωνία μέχρι το εμπόριο και τις συγκρούσεις, εξαρτάται από το διαδίκτυο, και τα συνακόλουθα ζητήματα κυβερνοασφάλειας αφορούν κυριολεκτικά τους πάντες. Αντιμετωπίζουμε νέα ερωτήματα που άπτονται των δικαιωμάτων και των... Περισσότερες Πληροφορίες', 'images/15.png','Formal Methods'),
        ('ΕΙΣΑΓΩΓΗ ΣΤΟΝ ΥΠΟΛΟΓΙΣΜΟ ΚΑΙ ΤΟΝ ΠΡΟΓΡΑΜΜΑΤΙΣΜΟ ΜΕ PYTHON', 'ΠΑΠΑΣΩΤΗΡΙΟΥ', '978-960-491-159-2', '600', 'comedy,romance,sociology,math,contemporary,mystery,science,education,fantasy', 'Με Εφαρμογές στην Υπολογιστική Μοντελοποίηση και την Κατανόηση Δεδομένων. Βασισμένο σε ένα «massive open online course» (MOOC) του MIT, το παρόν βιβλίο εισάγει τους φοιτητές με μικρή ή καθόλου πρότερη προγραμματιστική εμπειρία στην τέχνη της επίλυσης υπολογιστικών προβλημάτων με χρήση... Περισσότερες Πληροφορίες', 'images/16.png','Information Science,Computer Graphics,Simulation and Modeling,Social Network Analysis'),
        ('ΣΗΜΕΙΟ ΔΙ-ΕΠΑΦΗΣ', 'ΠΑΠΑΖΗΣΗΣ', '978-960-02-3946-1', '414', 'engineering,comic,literature,biography,mystery,science fiction,Greek literature', 'Πως αλλάζουν οι ανθρώπινες σχέσεις, καθώς διαμεσολαβούνται ολοένα και περισσότερο από νέα ψηφιακά εργαλεία; Πώς μετασχηματίζεται η ανθρώπινη εμπειρία όταν ένα είδος ψηφιακής μεμβράνης παρεμβάλλεται μεταξύ εξωτερικής και εσωτερικής πραγματικότητας; Γιατί στις ψηφιακά... Περισσότερες Πληροφορίες', 'images/17.png','Artificial Neural Networks,Discrete Mathematics,Genetic Algorithms,Information Science,Neuroscience,Computational Science,Artificial Intelligence,Digital Signal Processing,Virtual Reality'),
        ('ΕΠΙΣΤΗΜΗ ΥΠΟΛΟΓΙΣΤΩΝ', 'ΚΡΙΤΙΚΗ', '978-960-586-416-3', '736', 'math,literature,contemporary,crime', 'H Επιστήμη υπολογιστών προσφέρεται ως βασικό σύγγραμμα για ένα εισαγωγικό μάθημα στην πληροφορική. Οι συγγραφείς αναλύουν το υπολογιστικό σύστημα στα διάφορα επίπεδά του. Tο βιβλίο έχει σχεδιαστεί ώστε να παρέχει μια επισκόπηση των επιπέδων αυτών, παρουσιάζοντας τις... Περισσότερες Πληροφορίες', 'images/18.png','Big Data,Cybersecurity'),
        ('ADOBE INDESIGN ΒΗΜΑ ΠΡΟΣ ΒΗΜΑ 2021', 'ΓΚΙΟΥΡΔΑΣ Μ.', '978-960-512-752-7', '440', 'education,literature,contemporary,technology', 'Ο ταχύτερος, ευκολότερος και πιο περιεκτικός τρόπος για να μάθετε το Adobe InDesign. Το βιβλίο που κρατάτε στα χέρια σας αποτελεί μέλος της πιο δημοφιλούς σειράς πρακτικών οδηγών λογισμικού της Adobe, που προσφέρει όσα δεν προσφέρει κανένα άλλο βιβλίο ή εκπαιδευτικό πρόγραμμα –... Περισσότερες Πληροφορίες', 'images/19.png','High Performance Computing,Information Retrieval,Data Science,Computer Graphics,Numerical Analysis,Image Processing,Cybersecurity'),
        ('ΑΣΚΗΣΕΙΣ SPSS ΣΤΗΝ ΥΓΕΙΑ', 'ΠΑΠΑΖΗΣΗΣ', '978-960-02-3901-0', '462', 'engineering,Greek literature,finance,technology,math', 'Σκοπός των ασκήσεων που περιέχονται σε αυτό το βιβλίο, εκτός από την εξοικείωση του αναγνώστη στη χρήση του στατιστικού πακέτου SPSS, είναι και η εισαγωγή στη στατιστική ανάλυση δεδομένων. Στόχος του είναι να αποτελέσει ένα χρήσιμο εργαλείο εκμάθησης, εφαρμογής και... Περισσότερες Πληροφορίες', 'images/20.png','Web Development,Genetic Algorithms'),
        ('ΨΗΦΙΑΚΗ ΔΙΑΚΥΒΕΡΝΗΣΗ', 'ΠΑΠΑΖΗΣΗΣ', '978-960-02-3945-4', '656', 'art,health,contemporary,literature,children’s,science,thriller,education', '', 'images/21.png','Neuroscience,Database Management,Simulation and Modeling,Digital Signal Processing,Cloud Computing,Cybersecurity'),
        ('ΠΟΙΟΤΙΚΑ ΔΕΔΟΜΕΝΑ', 'ΜΠΑΡΜΠΟΥΝΑΚΗ', '978-960-267-464-2', '216', 'classic', 'Με το παρόν βιβλίο επιχειρείται μια εισαγωγική προσέγγιση στη συλλογή, επεξεργασία και ανάλυση δεδομένων ποιοτικής έρευνας με αναφορές στις πιο διαδεδομένες μεθόδους και τεχνικές του χώρου και χρήση συναρτήσεων λογισμικού ανοικτού κώδικα, και συγκεκριμένα της γλώσσας... Περισσότερες Πληροφορίες', 'images/22.png','Data Science,Web Development,Network Security,Machine Vision,Parallel Computing,Computer Vision'),
        ('ADOBE ILLUSTRATOR ΒΗΜΑ ΠΡΟΣ ΒΗΜΑ 2021', 'ΓΚΙΟΥΡΔΑΣ Μ.', '978-9605127503', '466', 'adventure,finance', 'Ο γρηγορότερος, ευκολότερος και πληρέστερος τρόπος να μάθετε το Adobe Illustrator. Η σειρά Βήμα προς Βήμα είναι μία πολύ επιτυχημένη σειρά εκπαιδευτικών βιβλίων και προσφέρει κάτι το οποίο δεν θα βρείτε σε άλλο βιβλίο ή εκπαιδευτικό πρόγραμμα – μία επίσημη εκπαιδευτική σειρά από... Περισσότερες Πληροφορίες', 'images/23.png','Game Development,Numerical Analysis,Distributed Computing,Neural Networks,Natural Language Processing,High Performance Computing'),
        ('ΕΙΣΑΓΩΓΗ ΣΤΗΝ ΠΛΗΡΟΦΟΡΙΚΗ 3η ΕΚΔΟΣΗ', 'ΚΡΙΤΙΚΗ', '978-960-586-407-1', '688', 'autobiography,travel,contemporary,history', 'Το σύγγραμμα Εισαγωγή στην πληροφορική συνεχίζει την επιτυχημένη του πορεία, καθώς αποτελεί μια ενδιαφέρουσα προσέγγιση στη διδασκαλία των θεμάτων και των δεξιοτήτων που απαιτούνται για την εις βάθος κατανόηση του ψηφιακού κόσμου. Με απλή και κατανοητή γλώσσα και... Περισσότερες Πληροφορίες', 'images/24.png','Neural Networks,Computer Vision,Data Science,Computer Security,Computer Architecture,Information Science'),
        ('ΚΛΕΙΣΕ ΜΕΡΙΚΑ ΠΑΡΑΘΥΡΑ', 'ΨΥΧΟΓΙΟΣ', '978-618-01-4160-3', '224', 'finance,poetry,psychology,health,art,contemporary,literature', 'Η Τάνια Γκούντιν, ειδική στην ψηφιακή απεξάρτηση, παρέχει σε όσους έχουν χαθεί στον κόσμο του Διαδικτύου έναν πρακτικό οδηγό, με σκοπό να τους βοηθήσει να βρουν την ισορροπία ανάμεσα στην ψηφιακή και στην πραγματική τους ζωή. Εάν νιώθετε ότι ο σύντροφός σας σας αγνοεί και... Περισσότερες Πληροφορίες', 'images/25.png','Multimedia Computing,Robotics,Computer Networks,Natural Language Processing,Computer Programming'),
        ('ΜΑΘΑΙΝΕΤΕ ΕΥΚΟΛΑ JOOMLA! 4X', 'ΑΒΑΚΑΣ', '978-960-6789-27-4', '560', 'contemporary', ' Κυκλοφορεί από τις εκδόσεις Άβακας το πρώτο βιβλίο για το Joomla! 4.x στα Ελληνικά. Με αυτό το βιβλίο θα μάθετε τα πάντα για τη νέα έκδοση του πιο δημοφιλούς Συστήματος Διαχείρισης Περιεχομένου (CMS) στον κόσμο, Joomla! 4. Δείτε σε απλή και κατανοητή γλώσσα πως να προσθέτετε άρθρα... Περισσότερες Πληροφορίες', 'images/26.png','Database Management,Robotics Engineering,Natural Language Processing,Computer Vision,Formal Methods,Data Mining,Machine Learning,Image Processing'),
        ('ΕΚΠΑΙΔΕΥΤΙΚΗ ΡΟΜΠΟΤΙΚΗ ΜΕ SPIKE ΤΟΜΟΣ 2', 'ΔΙΣΙΓΜΑ ΕΚΔΟΣΕΙΣ', '978-618-202-105-7', '112', 'science fiction,history,engineering,classic,poetry,mystery', 'Το παρόν βιβλίο, βασισμένο στο Spike Prime, το νέο εκπαιδευτικό πακέτο της Lego Education, αποτελεί το δεύτερο μέρος της νέας σειράς βιβλίων εκπαιδευτικής ρομποτικής. Απευθύνεται τόσο σε μαθητές όσο και σε ενήλικες, οι οποίοι έχουν αποκτήσει τις βασικές γνώσεις προγραμματισμού που... Περισσότερες Πληροφορίες', 'images/27.png','Formal Methods,Parallel Computing,Image Processing,Embedded Systems,Computational Science,Artificial Neural Networks,Numerical Analysis'),
        ('ΔΟΜΗΜΕΝΟΣ ΠΡΟΓΡΑΜΜΑΤΙΣΜΟΣ ΜΕ ΕΦΑΡΜΟΓΕΣ ΣΕ PYTHON', 'ΔΙΣΙΓΜΑ ΕΚΔΟΣΕΙΣ', '978-618-202-102-6', '578', 'poetry,health', 'Αυτό το βιβλίο έχει σκοπό να καλύψει τις ανάγκες του αναγνώστη που επιθυμεί να μάθει τις βασικές αρχές προγραμματισμού και να τις χρησιμοποιήσει σε κάποιες από τις πιο δημοφιλείς γλώσσες προγραμματισμού. Στα έξι πρώτα κεφάλαια, ο αναγνώστης θα έχει την ευκαιρία να... Περισσότερες Πληροφορίες', 'images/28.png','Cloud Computing,Operating Systems,Algorithms,Computer Science,Computer Graphics,Parallel Computing'),
        ('ΤΕΧΝΙΚΟ ΣΧΕΔΙΟ ΜΕ AUTOCAD ΣΕ ΑΠΛΑ ΑΥΤΟΤΕΛΗ ΜΑΘΗΜΑΤΑ', 'ΔΙΣΙΓΜΑ ΕΚΔΟΣΕΙΣ', '978-618-202-008-1', '664', 'contemporary,math,adventure,psychology,crime,engineering,Greek literature,children’s', 'Το βιβλίο απευθύνεται σε φοιτητές Πανεπιστημίων, μαθητές ΕΠΑΛ, καταρτιζόμενους ΙΕΚ και δια βίου μάθησης, καθώς και σε Μηχανικούς ή σχεδιαστές που θέλουν να αυξήσουν την παραγωγικότητά τους, δημιουργώντας τα σχέδιά τους στο δημοφιλές πρόγραμμα AutoCAD. Το βιβλίο δεν είναι ένα... Περισσότερες Πληροφορίες', 'images/29.png','Parallel Computing,Genetic Algorithms,Image Processing,Digital Signal Processing,Formal Methods,Algorithms,Distributed Computing'),
        ('ΤΟ Α ΚΑΙ ΤΟ Ω ΤΩΝ ΨΗΦΙΑΚΩΝ ΜΕΘΟΔΩΝ ΕΡΕΥΝΑΣ', 'ΠΕΔΙΟ', '978-960-635-373-4', '480', 'sociology,health', 'Ένας προσβάσιµος οδηγός που παρέχει συνοπτικές πληροφορίες για σύγχρονες ψηφιακές µεθόδους έρευνας. Συνδυάζοντας εισαγωγικές γνώσεις µε θέµατα πρακτικής εφαρµογής και περαιτέρω έρευνας, αποτελεί έναν χάρτη πορείας στο συχνά συγκεχυµένο πεδίο της ψηφιακής έρευνας, ενώ... Περισσότερες Πληροφορίες', 'images/30.png','Computer Animation'),
        ('ΤΕΧΝΗΤΗ ΝΟΗΜΟΣΥΝΗ ΓΙΑ ΟΛΟΥΣ', 'ΨΥΧΟΓΙΟΣ', '978-618-01-4294-5', '232', 'biography', 'Το βιβλίο αυτό είναι ένας συνοπτικός οδηγός που θα σας βοηθήσει να αντιληφθείτε τη δυναμική των τεχνολογικών εξελίξεων και να αποκτήσετε σφαιρική εικόνα των κύριων ζητημάτων που προκύπτουν από τη χρήση της τεχνητής νοημοσύνης σε όλο και περισσότερους τομείς της ζωής... Περισσότερες Πληροφορίες', 'images/31.png','Image Processing,Computer Graphics,Optimization'),
        ('ΣΥΓΧΡΟΝΟ ΠΕΡΙΒΑΛΛΟΝ ΓΡΑΦΕΙΟΥ, DIGITAL OFFICE, ΑΠΟ ΤΑ ΛΟΓΙΣΤΙΚΑ ΦΥΛΛΑ ΣΤΟ ΔΙΑΔΙΚΤΥΟ', '24 ΓΡΑΜΜΑΤΑ', '978-6182-014-165', '348', 'romance,math,management,autobiography,thriller', 'Η υιοθέτηση ενός ψηφιακού σύγχρονου γραφείου από τις επιχειρήσεις, λειτουργεί ενισχυτικά στο οικονομικό έλεγχο και τη διοίκηση τους. Επιπλέον είναι απαραίτητη, καθώς τις βοηθά να λειτουργούν και να λύνουν στοιχειώδη προβλήματα. Τα οφέλη είναι πολλά, ακόμη και στη... Περισσότερες Πληροφορίες', 'images/32.png','Internet of Things,Algorithms'),
        ('INSTAGRAM ΠΩΣ ΝΑ ΓΙΝΕΙΣ EXPERT ΣΕ 30 ΜΕΡΕΣ', 'ΔΙΑΝΟΙΑ', '978-618-5437-65-7', '128', 'biography,mystery,math,literature,children’s,adventure,travel', 'Ο Στέλιος Στυλιανίδης και η DSkomotini προσφέρουν σε ένα βιβλίο όλη την γνώση και την εμπειρία για την επιτυχία στο Instagram. Η προσέγγιση τους είναι αυτή που θα ήθελες. Όχι θεωρίες και δύσκολοι όροι, αλλά ένα προς ένα όλα τα βήματα που πρέπει να κάνεις για να έχεις έναν πετυχημένο... Περισσότερες Πληροφορίες', 'images/33.png','Genetic Algorithms,Software Engineering,Programming Languages,Embedded Systems,Neural Networks'),
        ('ΠΡΟΓΡΑΜΜΑΤΙΣΜΟΣ ΣΕ R ΓΙΑ ΤΗΝ ΕΠΙΣΤΗΜΗ ΤΩΝ ΔΕΔΟΜΕΝΩΝ', 'ΚΛΕΙΔΑΡΙΘΜΟΣ', '978-960-645-236-9', '568', 'science fiction,fantasy,sociology,technology,Greek literature', ' Εισαγωγή, τακτοποίηση, μετασχηματισμός, οπτικοποίηση και μοντελοποίηση των δεδομένων. Με το βιβλίο Προγραμματισμός σε R για την επιστήμη των δεδομένων θα μάθετε να χρησιμοποιείτε την R για να αποκτάτε διορατικά στοιχεία, ενδελεχείς γνώσεις και κατανόηση από... Περισσότερες Πληροφορίες', 'images/34.png','Electronics,Optimization,Big Data,Systems Analysis,Multimedia Computing'),
        ('PYTHON 3 ΑΛΓΟΡΙΘΜΙΚΗ ΚΑΙ ΠΡΟΓΡΑΜΜΑΤΙΣΜΟΣ', 'ΚΛΕΙΔΑΡΙΘΜΟΣ', '978-960-645-087-7', '800', 'adventure,thriller', 'δηγός για νέους και έμπειρους προγραμματιστές. Με χρήση του Visual Studio Code και δωρεάν συνοδευτικό υλικό στο Διαδίκτυο. Σύμφωνα με τον Jerome Bruner, η μάθηση απαιτεί ενεργή συμμετοχή του εκπαιδευόμενου, πειραματισμό, εξερεύνηση και ανακάλυψη. Το βιβλίο Python 3: Αλγοριθμική και... Περισσότερες Πληροφορίες', 'images/35.png','Optimization,Virtual Reality,Computer Security'),
        ('ΕΚΠΑΙΔΕΥΤΙΚΗ ΡΟΜΠΟΤΙΚΗ ΜΕ SPIKE PRIME ΤΟΜΟΣ 1', 'ΔΙΣΙΓΜΑ ΕΚΔΟΣΕΙΣ', '978-618-202-096-8', '146', 'crime,poetry,history,math,biography', ' Το παρόν βιβλίο αποτελεί το πρώτο μέρος από μία νέα σειρά βιβλίων Εκπαιδευτικής Ρομποτικής, απευθυνόμενο τόσο σε μαθητές όσο και ενήλικες, αρχάριους ή προχωρημένους. Ολοκληρωμένη η σειρά αποτελεί ένα πλήρη οδηγό για το πιο πρόσφατο εγχείρημα της LegoEducation, το SpikePrime. Οι... Περισσότερες Πληροφορίες', 'images/36.png','Genetic Algorithms,Social Network Analysis,Database Systems,Computer Organization,Data Mining'),
        ('ΤΕΧΝΙΚΟΣ ΑΥΤΟΜΑΤΙΣΜΩΝ ΑΠΑΝΤΗΣΕΙΣ ΕΟΠΠΕΠ', '24 ΓΡΑΜΜΑΤΑ', '978-6182-013-700', '246', 'art', '', 'images/37.png','Computer Networks,Distributed Computing,Optimization,Cryptography,Numerical Analysis'),
        ('ΚΑΤΑΝΟΩΝΤΑΣ ΤΑ ΜΕΣΑ ΚΟΙΝΩΝΙΚΗΣ ΔΙΚΤΥΩΣΗΣ', 'ΕΛΛΗΝΟΕΚΔΟΤΙΚΗ', '978960-563-386-8', '208', 'autobiography,psychology,history,crime,adventure', 'Η ραγδαία πρόοδος που έχει συντελεστεί από τον 20ό αιώνα μέχρι σήμερα στον τομέα της επιστήμης των Τεχνολογιών Πληροφορικής και Επικοινωνιών επέδρασε καταλυτικά σε κάθε πτυχή της ανθρώπινης δραστηριότητας. Η διάδοση του Διαδικτύου και η καθιέρωσή του ως το πιο δημοφιλές... Περισσότερες Πληροφορίες', 'images/38.png','Pattern Recognition,Social Network Analysis,Artificial Intelligence,Neural Networks,Computer Graphics,Database Systems,Control Engineering,Data Science'),
        ('ADOBE PHOTOSHOP ΒΗΜΑ ΠΡΟΣ ΒΗΜΑ ΕΚΔΟΣΗ 2021', 'ΓΚΙΟΥΡΔΑΣ Μ.', '978-960-512-749-7', '408', 'engineering,classic,technology,drama,fantasy,travel,autobiography,Greek literature,comic', 'Ο Ταχύτερος, Ευκολότερος και Πληρέστερος Τρόπος για να Μάθετε το Adobe Photoshop 2021. Η σειρά των βιβλίων Βήμα προς Βήμα, είναι το καλύτερο εκπαιδευτικό υλικό που μπορείτε να βρείτε στην αγορά για λογισμικό και προσφέρει αυτό που δεν κάνει κανένα άλλο βιβλίο ή εκπαιδευτικό... Περισσότερες Πληροφορίες', 'images/39.png','Distributed Computing,Robotics,Cryptography,Formal Methods,Cloud Computing,Deep Learning,Algorithms'),
        ('ΤΟ ΑΠΟΛΥΤΟ ΒΙΒΛΙΟ ΓΙΑ ΤΗ ΓΛΩΣΣΑ ΤΟΥ ΣΩΜΑΤΟΣ ΣΤΟ ΔΙΑΔΙΚΤΥΟ', 'ΕΚΔΟΣΕΙΣ ΙΒΙΣΚΟΣ', '978-618-5505-38-7', '384', 'biography,travel,Greek literature,fantasy,psychology,contemporary,comedy', 'Οι άνθρωποι χρησιμοποιούν τη γλώσσα του σώματος για να συνδεθούν και να χτίσουν εμπιστοσύνη. Όσο όμως η επικοινωνία τείνει να γίνεται εξ ολοκλήρου πίσω από μια οθόνη, τα παραδοσιακά σημάδια της γλώσσας του σώματος δεν είναι πια ορατά. Ή μήπως είναι. Απαντήσεις σε μέιλ που... Περισσότερες Πληροφορίες', 'images/40.png','Computer Programming,Artificial Intelligence,Neural Networks,Robotics,Human-Computer Interaction,Internet of Things,Computer Ethics,Social Network Analysis,Control Engineering'),
        ('ΕΙΣΑΓΩΓΗ ΣΤΙΣ ΒΑΣΕΙΣ ΔΕΔΟΜΕΝΩΝ', 'ΠΑΠΑΣΩΤΗΡΙΟΥ', '978-960-753-024-0', '192', 'poetry,math,autobiography,adventure', 'Το βιβλίο αυτό είναι ένα εισαγωγικό βιβλίο στις βάσεις δεδομένων. Αρκετό από το υλικό που συμπεριλαμβάνεται σε αυτό αποτελεί διδακτικό υλικό για το αντίστοιχο μάθημα στο Ελληνικό Ανοικτό Πανεπιστήμιο σε μία διαφορετική έκδοση ειδικά για εκπαίδευση από απόσταση. Σκοπός... Περισσότερες Πληροφορίες', 'images/41.png','Algorithms,Computer Ethics,Programming Languages,Numerical Analysis'),
        ('Η ΓΛΩΣΣΑ JAVASCRIPT 3Η ΕΚΔΟΣΗ', 'ΚΛΕΙΔΑΡΙΘΜΟΣ', '978-960-645-228-4', '976', 'math,biography,poetry,education,comic,drama,health,fantasy,autobiography', 'Καλύπτει και τη βιβλιοθήκη jQuery. Η γλώσσα JavaScript είναι η κύρια γλώσσα προγραμματισμού για το Διαδίκτυο, και χρησιμοποιείται από την πλειοψηφία των προγραμμα-τιστών τόσο για την ανάπτυξη αλληλεπιδραστικών εφαρμογών Ιστού όσο και σε άλλους τομείς, όπως είναι η δημιουργία... Περισσότερες Πληροφορίες', 'images/42.png','Neuroscience,Cryptography,Formal Methods,Multimedia Computing,Deep Learning,Machine Vision'),
        ('ΤΕΧΝΗΤΗ ΝΟΗΜΟΣΥΝΗ 4Η ΑΜΕΡΙΚΑΝΙΚΗ ΕΚΔΟΣΗ', 'ΚΛΕΙΔΑΡΙΘΜΟΣ', '978-960-645-187-4', '1216', 'romance,adventure,drama', 'Αυτή η έκδοση του βιβλίου παρουσιάζει τις αλλαγές που συνέβησαν στην ΤΝ από την προηγούμενη έκδοση του 2010: Γενικά, περίπου το 25% του περιεχομένου του βιβλίου είναι εντελώς καινούργιο. Το υπόλοιπο 75% έχει ξαναγραφεί σε μεγάλο βαθμό ώστε να παρουσιάζει μια πιο ενιαία εικόνα... Περισσότερες Πληροφορίες', 'images/43.png','Computer Vision,Information Science,Network Security,Computer Programming,Algorithms,Software Engineering'),
        ('ARDUINO ΑΛΓΟΡΙΘΜΙΚΗ ΠΡΟΓΡΑΜΜΑΤΙΣΜΟΣ ΚΑΙ ΕΦΑΡΜΟΓΕΣ', 'ΚΛΕΙΔΑΡΙΘΜΟΣ', '978-960-645-174-4', '912', 'Greek literature,science', 'Οδηγός για την ανάπτυξη εφαρμογών και εκπαιδευτικών δραστηριοτήτων STEM με το Arduino. Στη σημερινή εποχή, όπου και να ψάξουμε θα βρούμε κρυμμένους μηχανισμούς που ελέγχουν κάποιες συνθήκες και ενεργούν ανάλογα. Οι μηχανισμοί αυτοί συνήθως στηρίζονται σε μικροϋπολογιστές ή... Περισσότερες Πληροφορίες', 'images/44.png','Internet of Things,Algorithms,Image Processing,Numerical Analysis'),
        ('ΔΟΥΛΕΨΤΕ ΜΕ ΤΟ AUTOCAD 2022', 'ΚΛΕΙΔΑΡΙΘΜΟΣ', '978-960-645-234-5', '936', 'travel,art', 'Καλύπτει επίσης τo AutoCAD 2018 έως 2021, καθώς και τα Express Tools. Το βιβλίο αυτό αποτελεί τη συνέχεια της επιτυχημένης σειράς "Δουλέψτε με το AutoCAD" που ξεκίνησε το 1995 με την έκδοση 13 για DOS και συνεχίζεται μέχρι και την έκδοση 2022. Με το βιβλίο αυτό στα χέρια σας, μπορείτε να αισθανθείτε... Περισσότερες Πληροφορίες', 'images/45.png','Natural Language Processing,Computer Animation,Simulation and Modeling'),
        ('7+1  ΕΛΛΗΝΙΚΑ MICROSOFT WINDOWS 10-OFFICE 2019/365', 'ΚΛΕΙΔΑΡΙΘΜΟΣ', '978-960-645-231-4', '960', 'travel,autobiography,fantasy,literature', 'Γνωρίστε τον κόσμο των υπολογιστών μέσα από ένα και μόνο βιβλίο.Windows - Word -Excel -PowerPoint -Access -Outlook -Εισαγωγή στους Η/Υ   Εισαγωγή στο InternetΓραμμένο με απλά λόγια, απευθύνεται σε όλους τους χρήστες υπολογιστών που θέλουν να μάθουν γρήγορα και εύκολα τα Microsoft Windows 10 και τις... Περισσότερες Πληροφορίες', 'images/46.png','Genetic Algorithms,Cryptography,Human-Computer Interaction,Numerical Analysis,Parallel Computing'),
        ('ΕΠΙΣΤΗΜΗ ΔΕΔΟΜΕΝΩΝ ΒΑΣΙΚΕΣ ΑΡΧΕΣ ΚΑΙ ΕΦΑΡΜΟΓΕΣ ΜΕ PYTHON', 'ΠΑΠΑΣΩΤΗΡΙΟΥ', '978-960-491-144-8', '386', 'art,biography,literature,science', 'Για να μάθετε πραγματικά την επιστήμη δεδομένων, δεν πρέπει απλώς να κυριαρχήσετε στα εργαλεία –βιβλιοθήκες επιστήμης δεδομένων, πλαίσια, μονάδες κώδικα και εργαλειοθήκες–, αλλά επίσης να κατανοήσετε τις ιδέες και τις αρχές που διέπουν τη λειτουργία τους. Αυτή η δεύτερη... Περισσότερες Πληροφορίες', 'images/47.png','Computer Architecture,Neural Networks,Digital Signal Processing,Data Science,Computer Animation'),
        ('ΜΑΘΑΙΝΕΤΕ ΕΥΚΟΛΑ C Β ΕΚΔΟΣΗ', 'ΑΒΑΚΑΣ', '978-960-6789-29-8', '412', 'sociology,history,travel,contemporary,poetry,drama,technology', 'Ο κύριος σκοπός του βιβλίου είναι να παρουσιάσει στον αναγνώστη το σύνολο των στοιχείων της γλώσσας C και μέσω απλών παραδειγμάτων να τον εισαγάγει βήμα-βήμα στον προγραμματισμό. Η δομημένη μορφή του βιβλίου σε συνδυασμό με τα πολλά παραδείγματα θα βοηθήσουν τον... Περισσότερες Πληροφορίες', 'images/48.png','Database Management,Expert Systems,Operating Systems,Cryptography,Computer Security,Parallel Computing,Embedded Systems'),
        ('ΕΚΠΑΙΔΕΥΤΙΚΗ ΡΟΜΠΟΤΙΚΗ', 'ΔΙΣΙΓΜΑ ΕΚΔΟΣΕΙΣ', '978-618-202-082-1', '302', 'history', 'Ο Μικροελεγκτής BBC Micro:Bit είναι ένας οικονομικός μικροελεγκτής ειδικά σχεδιασμένος για θέματα S.T.E.M. και για εφαρμογές Εκπαιδευτικής Ρομποτικής. Λόγω των τεχνικών του χαρακτηριστικών, του μικρού μεγέθους και των ενσωματωμένων αισθητήρων αποτελεί μια ελκυστική λύση για τη... Περισσότερες Πληροφορίες', 'images/49.png','Web Development,Numerical Analysis,Pattern Recognition,Simulation and Modeling'),
        ('ΜΕΣΑ ΠΛΗΡΟΦΟΡΙΑ ΚΑΙ ΕΠΙΚΟΙΝΩΝΙΑ ΣΤΗΝ ΨΗΦΙΑΚΗ ΕΠΟΧΗ', 'ΕΚΔΟΣΕΙΣ OASIS', '978-618-84095-9-0', '274', 'drama,art,poetry,adventure,science,history,travel', 'Ο συλλογικός τόμος Μέσα, Πληροφορία και Επικοινωνία στην ψηφιακή εποχή, που έχω την τιμή να προλογίζω, προσφέρει αυτή την τόσο αναγκαία διεπιστημονική προσέγγιση στα φαινόμενα των μέσων και της επικοινωνίας. Οι επιστήμονες, που υπογράφουν τα άρθρα, προέρχονται από... Περισσότερες Πληροφορίες', 'images/50.png','Computer Animation,Data Science'),
        ('ΕΙΣΑΓΩΓΗ ΣΤΗΝ ΚΡΙΤΙΚΗ ΤΟΥ ΨΗΦΙΑΚΟΥ ΛΟΓΟΥ', 'ΙΔΙΩΤΙΚΗ', '978-618-84851-5-0', '320', 'technology,art,education,autobiography,Greek literature', 'Τι σημαίνει ψηφιακό; Τι είναι ο κυβερνοχώρος; Η παρούσα μελέτη αποτελεί ένα εγχειρίδιο για μια ευρύτερη έρευνα, υπόθεση της οποίας είναι ότι ο ψηφιακός κόσμος συγκροτεί μία εικονική πραγματικότητα όχι ως μιμητική αντανάκλαση, αλλά ως επέκταση και αναδημιουργία του... Περισσότερες Πληροφορίες', 'images/51.png','Database Management,Computer Animation,Embedded Systems,Data Science,Network Security'),
        ('ΣΧΕΣΙΑΚΕΣ ΒΑΣΕΙΣ ΔΕΔΟΜΕΝΩΝ 3Η ΕΚΔΟΣΗ', 'ΚΡΙΤΙΚΗ', '978-960-586-374-6', '600', 'romance,biography,mystery,science,adventure,crime,literature', 'Το βιβλίο πραγματεύεται τις έννοιες των σχεσιακών βάσεων δεδομένων, αναλύει τις θεωρητικές και πρακτικές προσεγγίσεις που χρησιμοποιούνται για τον σχεδιασμό τους και παρουσιάζει δημοφιλή λογισμικά περιβάλλοντα τα οποία έχουν αναπτυχθεί για την υλοποίηση και τη χρήση... Περισσότερες Πληροφορίες', 'images/52.png','High Performance Computing,Optimization'),
        ('ΑΡΧΕΣ ΚΑΙ ΤΕΧΝΙΚΕΣ ΠΡΟΓΡΑΜΜΑΤΙΣΜΟΥ ΜΕ ΤΗ ΓΛΩΣΣΑ C', 'ΚΡΙΤΙΚΗ', '978-960-586-377-7', '752', 'science fiction,travel,history,finance,science,children’s,autobiography', 'Το σύγγραμμα στοχεύει στη διδασκαλία της συστηματικής προσέγγισης στην επίλυση προβλημάτων, εφαρμόζοντας κοινά αποδεκτές μεθόδους ανάπτυξης λογισμικού για τη σχεδίαση προγραμματιστικών λύσεων. Μπορεί να χρησιμοποιηθεί στο πλαίσιο εισαγωγικών μαθημάτων στις μεθόδους... Περισσότερες Πληροφορίες', 'images/53.png','Parallel Computing,Programming Languages,Finite Element Analysis'),
        ('ΗΛΕΚΤΡΟΝΙΚΑ ΠΡΟΓΡΑΜΜΑΤΑ ΚΑΙ ΣΥΓΧΡΟΝΟ ΝΟΣΟΚΟΜΕΙΑΚΟ ΜΑΝΑΤΖΜΕΝΤ', 'ΠΕΔΙΟ', '978-960-635-368-0', '264', 'education', 'Ο ρόλος της πληροφορικής στο σύγχρονο σύστημα υγείας, μέσω της υλοποίησης των ολοκληρωμένων πληροφοριακών συστημάτων, μεταβάλλεται σταδιακά από περιφερειακό σε ουσιαστικό και από υποστηρικτικό σε στρατηγικό, στοχεύοντας στην ενίσχυση του νοσοκομειακού μάνατζμεντ. Ο... Περισσότερες Πληροφορίες', 'images/54.png','Cybersecurity,Digital Signal Processing,Computer Graphics,Computer Networks,Database Management,Social Network Analysis'),
        ('ΠΡΟΓΡΑΜΜΑΤΙΣΜΟΣ ΚΑΙ ΡΟΜΠΟΤΙΚΗ ΣΤΟ ΣΧΟΛΕΙΟ ΚΑΙ ΣΤΟ ΣΠΙΤΙ', 'ΚΑΚΤΟΣ', '978-960-382-090-1', '150', 'finance,science', 'Για πρώτη φορά στην Ελλάδα, μια σειρά βιβλίων για την Επιστήμη των Υπολογιστών, τον Προγραμματισμό και τη Ρομποτική, που απευθύνεται σε παιδιά, εφήβους και ενήλικες, αρχάριους ή προχωρημένους, χωρίς να απαιτεί καμία πρότερη γνώση, ούτε προμήθεια επιπρόσθετου υλικού, σε... Περισσότερες Πληροφορίες', 'images/55.png','Discrete Mathematics,Artificial Neural Networks,Software Engineering,Numerical Analysis,Distributed Computing,Embedded Systems,Computational Science,Genetic Algorithms'),
        ('ΗΛΕΚΤΡΟΝΙΚΗ ΔΙΑΚΥΒΕΡΝΗΣΗ ΚΑΙ ΗΛΕΚΤΡΟΝΙΚΕΣ ΥΠΗΡΕΣΙΕΣ ΠΡΟΣ ΠΟΛΙΤΕΣ ΚΑΙ ΕΠΙΧΕΙΡΗΣΕΙΣ', 'ΔΙΣΙΓΜΑ ΕΚΔΟΣΕΙΣ', '978-618-202-068-5', '456', 'Greek literature,technology', 'Η Ηλεκτρονική Διακυβέρνηση αγορά στον εκσυγχρονισμό του Κράτους και της Δημόσιας Διοίκησης, με όχημα τις Τεχνολογίες Πληροφοριών και Επικοινωνιών, με στόχο το ριζικό μετασχηματισμό των υφιστάμενων διαδικασιών και την αναβάθμιση των παρεχόμενων υπηρεσιών, σε υπηρεσίες... Περισσότερες Πληροφορίες', 'images/56.png','Mathematical Modeling,Computer Vision,Artificial Intelligence,Artificial Neural Networks,Cloud Computing,Data Mining'),
        ('ΟΠΛΑ ΜΑΘΗΜΑΤΙΚΗΣ ΚΑΤΑΣΤΡΟΦΗΣ', 'ΕΑΠ', '978-618-5497-14-9', '320', 'comic,science,children’s,engineering,science fiction,autobiography', '«Τα Όπλα Μαθημαζικής Καταστροφής είναι ένα συναρπαστικό, ειλικρινές σήμα συναγερμού. Αναγνωρίζει ότι τα μοντέλα δεν πρόκειται να εξαφανιστούν· ως εργαλεία για τον εντοπισμό ατόμων που αντιμετωπίζουν δυσκολίες είναι καταπληκτικά. Όμως, ως εργαλεία τιμωρίας και... Περισσότερες Πληροφορίες', 'images/57.png','Natural Language Processing,Programming Languages,Social Network Analysis,Formal Methods,Computer Graphics'),
        ('GDPR ΕΞΕΤΑΣΤΕΑ ΥΛΗ ΓΙΑ DATA PROTECTION OFFICER', 'ΕΚΔΟΣΕΙΣ ΦΥΛΑΤΟΣ', '978-960-658-024-6', '122', 'children’s,science,comedy,history,education,biography,health', 'Το βιβλίο αυτό γράφτηκε για να βοηθήσει και να διευκολύνει τις επιχειρήσεις στη συμμόρφωση με τον Γενικό Κανονισμό Προστασίας προσωπικών Δεδομένων (Γ.Κ.Π.Δ.) ευρέως γνωστό ως GDPR από την αγγλική ονομασία General Data Protection Regulation. Κεντρικό πρόσωπο για την εφαρμογή του κανονισμού... Περισσότερες Πληροφορίες', 'images/58.png','Distributed Computing,Computer Security,Computer Vision,Game Development,Multimedia Computing,Control Engineering,Neuroscience'),
        ('ΜΑΘΑΙΝΕΤΕ ΕΥΚΟΛΑ PYTHON (Γ  ΕΚΔΟΣΗ)', 'ΑΒΑΚΑΣ', '978-960-6789-30-4', '640', 'fantasy,sociology,science fiction,management,travel,art,autobiography,finance', 'Η γλώσσα προγραμματισμού Python είναι μια εύκολη στην εκμάθηση γλώσσα υψηλού επιπέδου, που χρησιμοποιείται τόσο στον χώρο της εκπαίδευσης όσο και ως επαγγελματικό εργαλείο ανάπτυξης εφαρμογών. Το βιβλίο αυτό σχεδιάσθηκε να αποτελέσει το κύριο βοήθημα για ένα βασικό μάθημα... Περισσότερες Πληροφορίες', 'images/59.png','Cloud Computing'),
        ('MINECRAFT ΓΙΑ ΝΕΟΥΣ ΧΡΗΣΤΕΣ', 'ΚΛΕΙΔΑΡΙΘΜΟΣ', '978-960-645-084-6', '64', 'mystery,crime,comedy,psychology,fantasy,math,romance', 'ΕΙΣΤΕ… ΠΡΩΤΑΡΗΔΕΣ ΣΤΟ MINECRAFT;Αυτό το βιβλίο είναι ιδανικό για να ξεκινήσετε την περιπλάνησή σας στην έκδοση Bedrock του Minecraft.Θα σας βοηθήσει να επιβιώσετε στον επικίνδυνο Επάνω Κόσμο, να εξορύσσετε υλικά, να βρίσκετε τροφή, να κατασκευάζετε εργαλεία, να χτίσετε το... Περισσότερες Πληροφορίες', 'images/60.png','Neural Networks'),
        ('WINDOWS 10 ΓΡΗΓΟΡΑ ΚΑΙ ΑΠΛΑ', 'ΔΙΣΙΓΜΑ ΕΚΔΟΣΕΙΣ', '978-618-202-033-3', '178', 'crime,mystery,sociology,fantasy', 'Το βιβλίο αυτό αποτελεί ένα φιλικό, οπτικό οδηγό που θα σας βοηθήσει να μάθετε να χρησιμοποιείτε τα ελληνικά Microsoft Windows 10. Τα κείμενα συνοδεύονται από πλήθος εικόνων που δείχνουν στους χρήστες οπτικά τις σχετικές διαδικασίες ώστε να μπορούν να τις παρακολουθήσουν και να... Περισσότερες Πληροφορίες', 'images/61.png','Image Processing,Web Development,Parallel Computing,Database Management,Software Engineering,Machine Learning,Statistical Analysis,Computer Science'),
        ('ΣΧΕΔΙΑΣΗ ΜΗΧΑΝΙΣΜΩΝ ΚΑΙ ΚΑΤΑΣΚΕΥΩΝ ΜΕ ΤΟ FREECAD', 'ΚΛΕΙΔΑΡΙΘΜΟΣ', '978-960-645-173-7', '224', 'technology,romance,poetry,comedy,adventure', 'Το FreeCAD είναι ένα λογισμικό παραμετρικής σχεδίασης που προσφέρεται δωρεάν ακόμα και για εμπορική χρήση. Το βιβλίο αυτό παρέχει μια γενική παρουσίαση των δυνατοτήτων του προγράμματος σε μια ποικιλία θεμάτων, όπως σχεδίαση 2D, σχεδίαση 3D, μηχανολογικό σχέδιο, αρχιτεκτονικό... Περισσότερες Πληροφορίες', 'images/62.png','Computer Security,Programming Languages'),
        ('ΨΗΦΙΑΚΗ ΕΠΟΧΗ', 'ΤΟΠΟΣ', '978-960-499-355-0', '432', 'comic,biography,mystery,contemporary,fantasy,travel,romance,art', 'Η βασική επιδίωξη του παρόντος βιβλίου είναι να κάνει µια «µαγνητική τοµογραφία» των ψηφιακών τεχνολογιών στη ζωή και στη λειτουργία του σύγχρονου καπιταλισµού. Ξεκινώντας από τις αλλαγές που επέρχονται στο πεδίο των παραγωγικών δυνάµεων, αναλύει την επίδρασή τους στις... Περισσότερες Πληροφορίες', 'images/63.png','High Performance Computing,Internet of Things,Computational Science,Computer Programming,Control Engineering,Cryptography,Statistical Analysis,Neuroscience'),
        ('PYTHON ΓΙΑ ΠΡΟΓΡΑΜΜΑΤΙΣΤΕΣ', 'ΓΚΙΟΥΡΔΑΣ Μ.', '978-960-512-718-3', '656', 'mystery,autobiography', 'O οδηγός Python® της Deitel® για τον επαγγελματία προγραμματιστή με εισαγωγικές μελέτες περιπτώσεων τεχνητής νοημοσύνηςΓραμμένο για προγραμματιστές με υπόβαθρο σε μία άλλη γλώσσα υψηλού επιπέδου, το βιβλίο αυτό χρησιμοποιεί οδηγίες από πρώτο χέρι για τη διδασκαλία των πλέον... Περισσότερες Πληροφορίες', 'images/64.png','Neural Networks,Robotics,Database Systems,Programming Languages,Information Science,Systems Analysis'),
        ('EXCEL 2019/365', 'ΔΙΣΙΓΜΑ ΕΚΔΟΣΕΙΣ', '978-618-202-031-9', '250', 'technology,science fiction,art,history,adventure,children’s,management', 'Το βιβλίο αυτό αποτελεί ένα φιλικό, οπτικό οδηγό που θα σας βοηθήσει να μάθετε γρήγορα και απλά να χρησιμοποιείτε την εφαρμογή Excel του ελληνικού Microsoft Office 2019/Microsoft 365. Τα κείμενα συνοδεύονται από πλήθος εικόνων που δείχνουν στους χρήστες οπτικά τις σχετικές διαδικασίες ώστε... Περισσότερες Πληροφορίες', 'images/65.png','Big Data,Computer Animation,Database Systems,Digital Signal Processing,Formal Methods'),
        ('ACCESS 2019/365', 'ΔΙΣΙΓΜΑ ΕΚΔΟΣΕΙΣ', '978-618-202-030-2', '154', 'contemporary,art', 'Το βιβλίο αυτό αποτελεί ένα φιλικό, οπτικό οδηγό που θα σας βοηθήσει να μάθετε γρήγορα και απλά να χρησιμοποιείτε την εφαρμογή Access του ελληνικού Microsoft Office 2019/Microsoft 365.Τα κείμενα συνοδεύονται από πλήθος εικόνων που δείχνουν στους χρήστες οπτικά τις σχετικές διαδικασίες... Περισσότερες Πληροφορίες', 'images/66.png','Genetic Algorithms,Digital Signal Processing,Natural Language Processing,Computer Programming,Database Systems,Deep Learning'),
        ('POWERPOINT 2019/365', 'ΔΙΣΙΓΜΑ ΕΚΔΟΣΕΙΣ', '978-618-202-029-6', '146', 'fantasy,crime,engineering,management', 'Το βιβλίο αυτό αποτελεί ένα φιλικό, οπτικό οδηγό που θα σας βοηθήσει να μάθετε γρήγορα και απλά να χρησιμοποιείτε την εφαρμογή PowerPoint του ελληνικού Microsoft Office 2019/Microsoft 365.Τα κείμενα συνοδεύονται από πλήθος εικόνων που δείχνουν στους χρήστες οπτικά τις σχετικές διαδικασίες... Περισσότερες Πληροφορίες', 'images/67.png','Computer Graphics,Formal Methods,Operating Systems,Neuroscience,Mathematical Modeling'),
        ('WORD 2019/365', 'ΔΙΣΙΓΜΑ ΕΚΔΟΣΕΙΣ', '978-618-032-6', '170', 'drama,sociology,technology,contemporary,adventure,health,literature', 'Το βιβλίο αυτό αποτελεί ένα φιλικό, οπτικό οδηγό που θα σας βοηθήσει να μάθετε γρήγορα και απλά να χρησιμοποιείτε την εφαρμογή Word του ελληνικού Microsoft Office 2019/Microsoft 365.Τα κείμενα συνοδεύονται από πλήθος εικόνων που δείχνουν στους χρήστες οπτικά τις σχετικές διαδικασίες ώστε... Περισσότερες Πληροφορίες', 'images/68.png','Database Management,Big Data,Genetic Algorithms,Game Development,Computer Ethics,Virtual Reality,Pattern Recognition,Computer Security,Algorithms'),
        ('ΔΙΚΤΥΑ ΥΠΟΛΟΓΙΣΤΩΝ ΚΑΙ ΔΙΑΔΙΚΤΥΟ', 'ΔΙΣΙΓΜΑ ΕΚΔΟΣΕΙΣ', '978-618-202-028-9', '142', 'technology,education,engineering,math,finance', 'Το βιβλίο αυτό αποτελεί ένα φιλικό, οπτικό οδηγό που θα σας εξοικειώσει γρήγορα και απλά με τα Δίκτυα Υπολογιστών και το Διαδίκτυο. Τα κείμενα συνοδεύονται από πλήθος εικόνων που δείχνουν στους χρήστες οπτικά τις σχετικές διαδικασίες ώστε να μπορούν να τις... Περισσότερες Πληροφορίες', 'images/69.png','Internet of Things,Computer Architecture,Optimization,Data Mining,Cloud Computing,Systems Analysis,Neural Networks'),
        ('ΕΙΣΑΓΩΓΗ ΣΤΗΝ PYTHON', 'ΓΚΙΟΥΡΔΑΣ Μ.', '978-9605127442', '864', 'fantasy,classic,biography,management', 'Στο βιβλίο αυτό θα εκπαιδευθείτε βιωματικά με τις πιο συναρπαστικές, τεχνολογίες αιχμής της υπολογιστικής – και, όπως θα δείτε, με ένα εύκολα ρυθμίσιμο μείγμα πληροφορικής και επιστήμης δεδομένων κατάλληλο για εισαγωγικά μαθήματα σε αυτούς και σε συναφείς τομείς. Και θα... Περισσότερες Πληροφορίες', 'images/70.png','Network Security,Computer Security,Social Network Analysis,Discrete Mathematics,Human-Computer Interaction,Artificial Neural Networks,Control Engineering,Database Systems'),
        ('Η ΚΥΒΕΡΝΟΨΥΧΟΛΟΓΙΑ ΩΣ ΚΑΘΗΜΕΡΙΝΗ ΨΗΦΙΑΚΗ ΕΜΠΕΙΡΙΑ', 'ΠΑΠΑΖΗΣΗΣ', '978-960-02-3668-2', '424', 'classic,romance,travel', 'Οι ψηφιακές τεχνολογίες ενσωματώνονται στην καθημερινή εμπειρία, παρέχοντας πρόσβαση σε πληροφορίες και προσφέ­ροντας διαρκή κοινωνική επαφή και διαμεσολάβηση στις περισσό­τερες από τις δραστηριότητες και τους τρόπους που συνδεόμαστε. Το συγκεκριμένο βιβλίο... Περισσότερες Πληροφορίες', 'images/71.png','Virtual Reality,Computer Vision,Web Development,Discrete Mathematics,Parallel Computing,Programming Languages,Embedded Systems,Electronics,Human-Computer Interaction'),
        ('ΣΤΑΤΙΣΤΙΚΗ ΕΦΑΡΜΟΣΜΕΝΗ ΣΤΙΣ ΚΟΙΝΩΝΙΚΕΣ ΕΠΙΣΤΗΜΕΣ', 'GUTENBERG', '978-960-01-2189-6', '576', 'comedy,engineering,travel', 'O κύριος στόχος του βιβλίου είναι να βοηθήσει τους φοιτητές και τους ερευνητές που προσεγγίζουν τη στατιστική με άγχος και δέος να κατανοήσουν ότι η εφαρμοσμένη στατιστική στις κοινωνικές επιστήμες δεν είναι ένα επιστημονικό πεδίο που αφορά μόνο λίγους, και μάλιστα... Περισσότερες Πληροφορίες', 'images/72.png','Programming Languages,Control Engineering,Digital Signal Processing,Database Systems,Human-Computer Interaction,Parallel Computing,Software Engineering'),
        ('ΣΤΑΤΙΣΤΙΚΗ ΓΙΑ ΟΛΟΥΣ ΜΕ ΤΟ SPSS', 'ΣΟΦΙΑ', '978-960-6706-68-4', '320', 'mystery,travel,poetry,literature,Greek literature,thriller', 'Απευθύνεται κυρίως σε φοιτητές/τριες των Κοινωνικών Επιστημών αλλά και σε κοινωνικούς ερευνητές/τριες και αποτελεί ένα εισαγωγικό εγχειρίδιο που αφορά στο στατιστικό λογισμικό πακέτο SPSS (Statistical Package for the Social Sciences). Είναι ένας πρακτικός οδηγός ανάλυσης δεδομένων, ο οποίος... Περισσότερες Πληροφορίες', 'images/73.png','Data Mining,Electronics,Algorithms,Human-Computer Interaction,Data Science'),
        ('ΧΩΡΙΚΗ ΑΝΑΛΥΣΗ', 'ΔΙΣΙΓΜΑ ΕΚΔΟΣΕΙΣ', '978-618-202-021-0', '314', 'biography,fantasy,classic,travel,management,Greek literature,romance', 'Η χωρική ανάλυση φαινομένων αποκτά ολοένα και περισσότερο σημασία τα τελευταία χρόνια καθώς προσπαθούμε να αναλύσουμε πολύπλοκα φαινόμενα τα οποία έχουν χωρική υπόσταση. Από τις θέσεις κεραιών κινητής τηλεφωνίας έως τις θέσεις εμφάνισης φυτικών ειδών. Η γεωστατιστική... Περισσότερες Πληροφορίες', 'images/74.png','Neuroscience,Computer Animation,Computer Programming,Database Management,Electronics,Information Science,Genetic Algorithms,Statistical Analysis,Computer Science'),
        ('ΥΠΟΛΟΓΙΣΤΙΚΗ ΟΙΚΟΝΟΜΕΤΡΙΑ', 'ΔΙΣΙΓΜΑ ΕΚΔΟΣΕΙΣ', '978-618-202-015-9', '764', 'finance,Greek literature,art,technology,engineering', 'Το βιβλίο αυτό αποτελεί συνδυασμό της βασικής θεωρίας της Οικονομετρίας με παραδείγματα, ασκήσεις και οδηγίες για τη χρήση προγραμμάτων σε Η/Υ. Καθώς αποσκοπεί να βοηθήσει τον αναγνώστη/αναγνώστρια να χρησιμοποιήσει μεθοδικά τις κατάλληλες οικονομετρικές μεθόδους... Περισσότερες Πληροφορίες', 'images/75.png','Numerical Analysis'),
        ('ΚΑΤΑΝΟΩΝΤΑΣ ΚΑΙ ΑΛΛΑΖΟΝΤΑΣ ΤΟΝ ΚΟΣΜΟ', 'ΑΡΜΟΣ', '978-960-615-335-8', '264', 'crime', 'Η κατάθεση ψυχής ενός από τους διαπρεπέστερους Έλληνες στον κόσμο, που θεωρείται ως μια διάνοια της επιστήμης της πληροφορικής. Τιμημένου με το βραβείο Turing, την ανώτατη διάκριση στην πληροφορική. Χάρη σ΄ αυτόν σήμερα τα αεροπλάνα πετάνε με μεγαλύτερη ασφάλεια. Επίσης οι... Περισσότερες Πληροφορίες', 'images/76.png','Machine Vision,Artificial Neural Networks,Database Systems,Natural Language Processing,Data Mining'),
        ('Η ΓΛΩΣΣΑ ΠΡΟΓΡΑΜΜΑΤΙΣΜΟΥ PYTHON', 'ΔΙΣΙΓΜΑ ΕΚΔΟΣΕΙΣ', '978-618-202-003-6', '592', 'science,science fiction,children’s,romance,engineering,education,contemporary', 'Η γλώσσα προγραμματισμού Python μέσα από παραδείγματα και ασκήσεις είναι ο οδηγός εκμάθησης της γλώσσας προγραμματισμού Python με τις περισσότερες πωλήσεις στον κόσμο. Πρόκειται για μια εντατική και ενδελεχή εισαγωγή στον προγραμματισμό με Python η οποία θα σας βοηθήσει να... Περισσότερες Πληροφορίες', 'images/77.png','Artificial Neural Networks,Software Engineering'),
        ('7 ΣΕ 1 WINDOWS 10 OFFICE 2019/MICROSOFT 365', 'ΔΙΣΙΓΜΑ ΕΚΔΟΣΕΙΣ', '978-618-202-011-1', '878', 'literature,Greek literature,drama,psychology,thriller,engineering,comic', 'Η 3η αναβαθμισμένη έκδοση αυτού του βιβλίου θα σας βοηθήσει να μάθετε οπτικά και με εύκολο και φιλικό τρόπο να χρησιμοποιείτε τα Windows 10 και να εξοικειωθείτε με τις εφαρμογές του Office 2019 / Microsoft 365 (Word, Excel, PowerPoint, Access, Outlook).Το βιβλίο έχει ενημερωθεί με τις τελευταίες εξελίξεις... Περισσότερες Πληροφορίες', 'images/78.png','Computer Architecture,Data Science,Simulation and Modeling,Parallel Computing'),
        ('MICROSOFT EXCEL 2019', 'ΑΒΑΚΑΣ', '978-960-6789-26-7', '592', 'engineering', 'Το βιβλίο αυτό είναι ιδανικό για τον προχωρημένο χρήστη που θέλει να εκμεταλλευτεί τις ισχυρές δυνατότητες του Excel 2019.Το πρώτο μέρος ολοκληρώνει το θεωρητικό κομμάτι, ενώ στο δεύτερο αναφέρονται οι πιο σημαντικές συναρτήσεις με πολλά παραδείγματα. Στο τρίτο μέρος... Περισσότερες Πληροφορίες', 'images/79.png','Mathematical Modeling,Game Development,Neural Networks,Human-Computer Interaction'),
        ('Ο ΣΗΜΑΣΙΟΛΟΓΙΚΟΣ ΙΣΤΟΣ ΓΙΑ ΤΟΥΣ ΔΗΜΙΟΥΡΓΟΥΣ ΟΝΤΟΛΟΓΙΩΝ', 'ΔΙΣΙΓΜΑ ΕΚΔΟΣΕΙΣ', '978-618-202-007-4', '464', 'art,romance,science fiction,contemporary,education,health,travel', 'Επειδή οι επιχειρήσεις βασίζονται όλο και περισσότερο στο διαδίκτυο, οι μηχανικοί δεδομένων και λογισμικών προσπαθούν να χρησιμοποιήσουν τις νέες τεχνολογίες για να δημιουργήσουν σημασιολογικό περιεχόμενο και εφαρμογές που απευθύνονται σε αυτό το περιεχόμενο.Η... Περισσότερες Πληροφορίες', 'images/80.png','Social Network Analysis,Computer Security,Programming Languages,Cloud Computing,Machine Vision,Statistical Analysis,Deep Learning,Computer Organization,Discrete Mathematics'),
        ('ΗΛΕΚΤΡΟΝΙΚΟ ΕΜΠΟΡΙΟ ΚΑΙ ΕΦΑΡΜΟΓΕΣ ΔΙΑΔΙΚΤΥΟΥ', 'ΔΙΣΙΓΜΑ ΕΚΔΟΣΕΙΣ', '978-618-5242-95-4', '730', 'Greek literature,mystery,contemporary,biography,engineering', 'Η νέα έκδοση του βιβλίου είναι αποτέλεσμα της μακροχρόνιας ενασχόλησης των συγγραφέων με το αντικείμενο της Ηλεκτρονικής Επιχειρησιακής Δράσης και των συστηματικών τους προσπαθειών να μεταφέρουν στους φοιτητές τις σημαντικότερες γνώσεις γύρω από το συγκεκριμένο... Περισσότερες Πληροφορίες', 'images/81.png','Electronics,Finite Element Analysis,Multimedia Computing,Computer Ethics,Machine Learning'),
        ('Η ΤΕΧΝΗ ΠΡΟΓΡΑΜΜΑΤΙΣΜΟΥ ΤΩΝ LEGO MINDSTORMS EV3', 'ΔΙΣΙΓΜΑ ΕΚΔΟΣΕΙΣ', '978-618-5242-98-5', '318', 'technology,engineering,science fiction,contemporary', 'Η γλώσσα οπτικού προγραμματισμού των LEGO® MINDSTORMS® EV3, που βασίζεται σε μπλοκ, έχει σχεδιαστεί για να επιτρέψει σε οποιονδήποτε να προγραμματίσει έξυπνα ρομπότ. Διαθέτει ισχυρότατα χαρακτηριστικά που στην αρχή μπορούν να προκαλέσουν φόβο στον αρχάριο. Το βιβλίο "Η Τέχνη... Περισσότερες Πληροφορίες', 'images/82.png','Big Data,Data Science,Human-Computer Interaction,Pattern Recognition,Deep Learning'),
        ('ΕΝΣΩΜΑΤΩΜΕΝΑ ΣΥΣΤΗΜΑΤΑ ΟΙ ΜΙΚΡΟΕΛΕΓΚΤΕΣ AVR ΚΑΙ ARDUINO', 'ΔΙΣΙΓΜΑ ΕΚΔΟΣΕΙΣ', '978-618-5242-80-0', '680', 'biography,history,adventure,poetry,thriller,math,science fiction,autobiography', 'Στο βιβλίο αυτό γίνεται εκτενής αναφορά στην αρχιτεκτονική και τον προγραμματισμό του μικροελεγκτή ATmega8515, που αποτελεί έναν από τους μικροελεγκτές AVR της ATMEL καθώς και στην αναπτυξιακή πλατφόρμα Arduino.Ιδιαίτερη μνεία επιχειρείται στα ηλεκτρονικά που αφορούν τα... Περισσότερες Πληροφορίες', 'images/83.png','Computer Graphics,Machine Learning,Electronics,Control Engineering'),
        ('ΕΚΠΑΙΔΕΥΤΙΚΗ ΡΟΜΠΟΤΙΚΗ ΤΟΜΟΣ Α', 'ΔΙΣΙΓΜΑ ΕΚΔΟΣΕΙΣ', '978-618-202-024-1', '164', 'engineering,math,fantasy,sociology,education,science fiction,biography,poetry', 'Το βιβλίο "Εκπαιδευτική Ρομποτική - Mindstorms EV3, τόμος Α", είναι ένας αναλυτικός οδηγός ο οποίος έχει σκοπό να εισάγει τον αναγνώστη στον κόσμο της εκπαιδευτικής ρομποτικής και στα πλεονεκτήματα που παρέχει μέσω της μεθόδου διδασκαλίας S.T.E.M.Χωρισμένο σε 4 μέρη το βιβλίο... Περισσότερες Πληροφορίες', 'images/84.png','Human-Computer Interaction'),
        ('ΕΙΣΑΓΩΓΗ ΣΤΙΣ ΨΗΦΙΑΚΕΣ ΣΠΟΥΔΕΣ', 'ΡΟΠΗ', '978-618-5289-48-5', '414', 'science,crime,drama', 'Το βιβλίο αυτό είναι ένας Αναγνώστης. Είναι, δηλαδή, μια συλλογή κειμένων που έχει στόχο να φέρει σε επαφή την αναγνώστρια ή τον αναγνώστη με ορισμένα από τα αντιπροσωπευτικότερα κείμενα που θεμελίωσαν το πεδίο των Ψηφιακών Σπουδών. Η επιλογή των κειμένων έχει στόχο,... Περισσότερες Πληροφορίες', 'images/85.png','Cloud Computing,Discrete Mathematics,Programming Languages,Deep Learning,Computer Ethics,Web Development,Simulation and Modeling,Computer Architecture'),
        ('ΕΦΑΡΜΟΣΜΕΝΗ ΕΠΙΧΕΙΡΗΣΙΑΚΗ ΕΡΕΥΝΑ ΚΑΙ ΓΡΑΜΜΙΚΟΣ ΠΡΟΓΡΑΜΜΑΤΙΣΜΟΣ', 'ΚΡΙΤΙΚΗ', '978-960-586-335-7', '464', 'romance,technology,psychology,biography', 'Ο συνδυασμός ενός ισχυρού θεωρητικού υπόβαθρου, της χρήσης δεδομένων σε μεγάλη έκταση (Big Data), αλλά και της ευχέρειας εφαρμογής εμπειρικών μεθόδων είναι χαρακτηριστικά αναγκαία στη σύγχρονη εποχή της πληροφορίας εξαιτίας της πολυπλοκότητας των προβλημάτων που οι... Περισσότερες Πληροφορίες', 'images/86.png','Game Development'),
        ('ΝΕΑ ΣΚΟΤΕΙΝΗ ΕΠΟΧΗ', 'ΜΕΤΑΙΧΜΙΟ', '978-618-03-2054-1', '328', 'drama,Greek literature,literature,comedy,science,autobiography,thriller,poetry', 'Μια πραγματεία για το σύγχρονο τεχνολογικό μας αδιέξοδο γραμμένη με ευρυμάθεια, ματιά διεπιστημονική, κριτική, διεισδυτική και ελεύθερη, αναφορές που εκτείνονται από την τέχνη και τη μαζική κουλτούρα ως την ιστορία της τεχνολογίας, τη φιλοσοφία και την πολιτική... Περισσότερες Πληροφορίες', 'images/87.png','Artificial Intelligence,Computer Graphics,Web Development,Computer Ethics,Robotics Engineering,Discrete Mathematics,Control Engineering,Programming Languages,Embedded Systems'),
        ('ΟΡΓΑΝΩΣΗ ΚΑΙ ΣΧΕΔΙΑΣΗ ΥΠΟΛΟΓΙΣΤΩΝ Β ΤΟΜΟΣ', 'ΚΛΕΙΔΑΡΙΘΜΟΣ', '978-960-461-353-3', '472', 'comedy,mystery,travel,education,literature,art', '"Οι Ν. Πάτερσον και Τ. Χένεσι βελτίωσαν σε μεγάλο βαθμό αυτό που ήταν ήδη το χρυσό πρότυπο των βιβλίων. Στο ταχέως εξελισσόμενο πεδίο της αρχιτεκτονικής υπολογιστών, έχουν συγκεντρώσει έναν εντυπωσιακό αριθμό πρόσφατων μελετών περιπτώσεων και σύγχρονων θεμάτων σε ένα... Περισσότερες Πληροφορίες', 'images/88.png','Artificial Neural Networks,Image Processing,Deep Learning,Software Engineering,Optimization,Multimedia Computing'),
        ('C++ ΠΡΟΓΡΑΜΜΑΤΙΣΜΟΣ 9η ΕΚΔΟΣΗ', 'ΓΚΙΟΥΡΔΑΣ Μ.', '978-960-512-680-3', '1262', 'psychology,fantasy,engineering', 'Εκατομμύρια σπουδαστές και επαγγελματίες σε όλο τον κόσμο μαθαίνουν προγραμματισμό και ανάπτυξη λογισμικού με βιβλία, βίντεο LiveLessonsΤΜ και ηλεκτρονικές εκδόσεις της Dietel.Το C   Προγραμματισμός 9η έκδοση παρουσιάζει μια καθαρή, απλή, ενδιαφέρουσα και διασκεδαστική... Περισσότερες Πληροφορίες', 'images/89.png','Computer Science,Discrete Mathematics,Artificial Intelligence,Web Development,Machine Learning'),
        ('C ++ 347 ΛΥΜΕΝΕΣ ΑΣΚΗΣΕΙΣ ΜΕ ΣΧΟΛΙΑ', 'ΔΡΑΚΟΠΟΥΛΟΣ ΑΝΑΣΤΑΣΙΟΣ', '978-618-84987-0-9', '487', 'comedy,management,crime', 'Το βιβλίο αυτό αποτελεί σύνοψη τού βιβλίου “Λυμένες Ασκήσεις C  ”, 2020, ISBN 978-618-00-2137-0 . Περιέχει περίπου το 70% του περιεχομένου και 93 λιγότερες ασκήσεις από αυτό παραλείποντας τα προχωρημένα θέματα τής γλώσσας και δημιουργώντας έτσι μια συνοπτική αλλά ουσιαστική παρουσίασή... Περισσότερες Πληροφορίες', 'images/90.png','Robotics,Database Management,Cryptography,Computer Architecture,Network Security,Cybersecurity,Neural Networks'),
        ('C ++ 110 ΛΥΜΕΝΕΣ ΑΣΚΗΣΕΙΣ ΠΡΟΧΩΡΗΜΕΝΑ ΘΕΜΑΤΑ', 'ΔΡΑΚΟΠΟΥΛΟΣ ΑΝΑΣΤΑΣΙΟΣ', '978-618-84987-1-6', '293', 'classic,education,science fiction,history,crime,biography,technology,comedy', 'Το περιεχόμενο τού βιβλίου αυτού συμπεριλαμβάνεται στην έκδοση “Λυμένες Ασκήσεις C  ” ISBN:978-618-00-2137-0 . Η ανεξάρτητη κυκλοφορία απευθύνεται στους αναγνώστες οι οποίοι έχουν μια βασική γνώση τής γλώσσας C   και επιθυμούν να αποσαφηνίσουν ορισμένα απο τα θέματα τής γλώσσας τα... Περισσότερες Πληροφορίες', 'images/91.png','Database Management,Discrete Mathematics'),
        ('ΛΥΜΕΝΕΣ ΑΣΚΗΣΕΙΣ C++', 'ΔΡΑΚΟΠΟΥΛΟΣ ΑΝΑΣΤΑΣΙΟΣ', '978-618-00-2137-0', '879', 'biography', 'Η γλώσσα C   είναι η γλώσσα που διαδραματίζει σημαντικό ρόλο στο χώρο της πληροφορικής ενσωματώνοντας τόσο το διαδικαστικό όσο και το αντικειμενοστραφές πρότυπο προγραμματισμού. Το βιβλίο αυτό ξεκινάει την περιγραφή της γλώσσας από το επίπεδο του έμπειρου χρήστη της... Περισσότερες Πληροφορίες', 'images/92.png','Operating Systems,Cloud Computing'),
        ('ΛΥΜΕΝΕΣ ΑΣΚΗΣΕΙΣ STL C++', 'ΔΡΑΚΟΠΟΥΛΟΣ ΑΝΑΣΤΑΣΙΟΣ', '978-618-00-2138-7', '241', 'literature,health,classic,poetry,romance,psychology', 'Η μελέτη της γλώσσας C   είναι ελλιπής αν δεν αναφερθούμε στην Standard Template Library (STL). Η βιβλιοθήκη αυτή συμπληρώνει την γλώσσα C   με μια πληθώρα δομών δεδομένων έτοιμων για χρήση. Με την βιβλιοθήκη αυτή, η δουλειά του προγραμματιστή γίνεται πολύ ευκολότερη και ανεβάζει την... Περισσότερες Πληροφορίες', 'images/93.png','Robotics,Data Science,Control Engineering'),
        ('ΑΝΘΡΩΠΟΣ ΣΤΗΝ ΕΠΟΧΗ ΤΟΥ ΑΛΓΟΡΙΘΜΟΥ', 'ΠΑΠΑΣΩΤΗΡΙΟΥ', '978-960-491-140-0', '264', 'mystery', 'Κατηγορείστε για ένα έγκλημα. Ποιον θα προτιμούσατε να σας δικάσει- έναν άνθρωπο ή έναν αλγόριθμο;Η Hannah Fry εξηγεί την πραγματική σημασία που έχουν για τη ζωή μας οι πολύπλοκοι αλγόριθμοι των συστημάτων τεχνητής νοημοσύνης, αναδεικνύοντας, με λακωνικά αλλά στέρεα... Περισσότερες Πληροφορίες', 'images/94.png','Web Development,Multimedia Computing,Digital Signal Processing,Control Engineering,Cybersecurity'),
        ('ΟΡΓΑΝΩΣΗ ΚΑΙ ΣΧΕΔΙΑΣΗ ΥΠΟΛΟΓΙΣΤΩΝ', 'ΔΙΣΙΓΜΑ ΕΚΔΟΣΕΙΣ', '978-618-5242-61-9', '458', 'science,literature,poetry,comedy,art,Greek literature,drama', 'Το βιβλίο αυτό γράφτηκε για να καλύψει τις ανάγκες των προγραμμάτων σπουδών των Ελληνικών Πανεπιστημίων με ένα σύγγραμμα που θα εισήγαγε τον φοιτητή στην δομή και τη λειτουργία ενός Υπολογιστικού Συστήματος.Γίνεται μια προσπάθεια να παρουσιαστούν έννοιες όπως ... Περισσότερες Πληροφορίες', 'images/95.png','Cryptography,Electronics,Computer Animation,Parallel Computing,Game Development,Operating Systems,Control Engineering,Artificial Neural Networks,Data Science'),
        ('ΠΛΗΡΟΦΟΡΙΑΚΑ ΣΥΣΤΗΜΑΤΑ ΥΓΕΙΑΣ', 'ΠΑΠΑΖΗΣΗΣ', '978-960-02-3586-9', '517', 'psychology', 'Το παρόν βιβλίο με τίτλο «Πληροφοριακά Συστήματα Υγείας και Ηλεκτρονικές Υπηρεσίες» αφορά στη μελέτη των Πληροφοριακών Συστημάτων στο χώρο της Υγείας, σε τεχνολογικό, θεωρητικό όσο και οργανωτικό επίπεδο. Μέσα από ξεχωριστές ενότητες το βιβλίο α) επιχειρεί μια... Περισσότερες Πληροφορίες', 'images/96.png','Neural Networks,Computer Programming,Computer Organization,Finite Element Analysis,Formal Methods,Image Processing,Machine Learning,Parallel Computing'),
        ('ΕΛΛΗΝΙΚΟ MICROSOFT OFFICE 2019 ΒΗΜΑ ΒΗΜΑ', 'ΚΛΕΙΔΑΡΙΘΜΟΣ', '978-960-645-018-1', '496', 'poetry,autobiography,science fiction,art,thriller,psychology,biography', 'Μάθετε εύκολα πώς να χρησιμοποιείτε το Microsoft Office 2019 ή το Office 365 και πώς να κάνετε περισσότερα πράγματα πιο γρήγορα. Με τα βιβλία της σειράς Βήμα Βήμα θα βρείτε τις απαντήσεις που χρειάζεστε, τη στιγμή που τις χρειάζεστε:Τα σύντομα μαθήματα και οι αναλυτικές εικόνες σάς... Περισσότερες Πληροφορίες', 'images/97.png','Parallel Computing,Cloud Computing'),
        ('ΜΑΘΑΙΝΕΤΕ ΕΥΚΟΛΑ WORD PRESS 5 x', 'ΑΒΑΚΑΣ', '978-960-6789-28-1', '352', 'art,comic,Greek literature,sociology', 'Κυκλοφορεί από τις εκδόσεις Άβακας το βιβλίο WordPress 5.x στα Ελληνικά.Με αυτό το βιβλίο θα μάθετε τα πάντα για τη νέα έκδοση του δημοφιλούς Συστήματος Διαχείρισης Περιεχομένου (CMS), WordPress 5.x.Δείτε σε απλή και κατανοητή γλώσσα πώς να προσθέτετε άρθρα χωρισμένα σε κατηγορίες,... Περισσότερες Πληροφορίες', 'images/98.png','Big Data,Multimedia Computing,Cybersecurity,Computer Programming'),
        ('ΤΟ XELATEX ΓΙΑ ΑΡΧΑΡΙΟΥΣ', 'ΚΛΕΙΔΑΡΙΘΜΟΣ', '978-960-645-071-6', '342', 'technology,thriller,literature,crime,romance', 'Ένα βιβλίο για τον νέο χρήστη του XeLaTeX, μιας μοντέρνας έκδοσης του LaTeX με στόχο να καλύψει τις βασικές του ανάγκες. Η παρουσίαση των διαφόρων θεμάτων γίνεται με απλό και εύληπτο τρόπο και συνοδεύεται από πολλά παραδείγματα. Γίνεται εμπεριστατωμένη αναφορά σε θέματα... Περισσότερες Πληροφορίες', 'images/99.png','Artificial Intelligence'),
        ('ΕΚΠΑΙΔΕΥΣΗ ΣΤΗΝ ΕΠΕΞΕΡΓΑΣΙΑ ΚΕΙΜΕΝΟΥ', 'ΤΖΙΟΛΑΣ', '960-418-120-3', '238', 'math,drama', 'Τα κεφάλαια του βιβλίου διαρθρώνονται ως εξής: - Στο κεφάλαιο 1 παρουσιάζουμε τον τρόπο εγκατάστασης του πακέτου εφαρμογών γραφείου OpenOffice.org και συγκεκριμένα της ελληνικής έκδοσης για MS Windows που περιέχεται στο συνοδευτικό CD του βιβλίου. - Το κεφάλαιο 2 παρουσιάζει συνολικά... Περισσότερες Πληροφορίες', 'images/100.png','Systems Analysis,Social Network Analysis,Computer Security,Machine Learning,Computer Animation,Expert Systems,Database Systems,Optimization'),
        ('ΑΝΑΛΥΣΗ ΔΕΔΟΜΕΝΩΝ ΜΕ ΤΗΝ R', 'ΔΙΣΙΓΜΑ ΕΚΔΟΣΕΙΣ', '978-618-5242-56-5', '488', 'art,romance', 'Από την αστρονομία ως την μοριακή βιολογία και από την κοινωνιολογία ως τα οικονομικά, ο όγκος και η πολυπλοκότητα των δεδομένων που συλλέγουμε και καλούμαστε να αναλύσουμε αυξάνονται με εκρηκτικούς ρυθμούς. Eπιστήμονες, ερευνητές, επαγγελματίες και ερασιτέχνες από τις... Περισσότερες Πληροφορίες', 'images/101.png','Numerical Analysis,Computer Ethics,Formal Methods,Big Data,Optimization'),
        ('ΨΗΦΙΑΚΗ ΣΧΕΔΙΑΣΗ ΜΕ ΤΗ ΓΛΩΣΣΑ VHDL', 'ΔΙΣΙΓΜΑ ΕΚΔΟΣΕΙΣ', '978-618-5242-60-2', '894', 'contemporary,art,biography,engineering', 'Το παρόν σύγγραμμα εμπεριέχει ύλη που καλύπτει πλήρως τις διαδικασίες σχεδίασης ψηφιακών συστημάτων με εκτενή αναφορά στις πρακτικές οι οποίες χρησιμοποιούνται στην υλοποίησή τους με τη χρήση κλασικών ολοκληρωμένων κυκλωμάτων.Γίνεται αναφορά στις γλώσσες σχεδίασης... Περισσότερες Πληροφορίες', 'images/102.png','Natural Language Processing,Neural Networks,Data Mining,Human-Computer Interaction,Computer Animation,Big Data,Deep Learning,Information Retrieval'),
        ('ΕΙΣΑΓΩΓΗ ΣΤΗΝ ΠΛΗΡΟΦΟΡΙΚΗ 10η ΕΚΔΟΣΗ', 'ΓΚΙΟΥΡΔΑΣ Μ.', '978-960-512-667-4', '672', 'crime,finance,technology', 'Όταν η τεχνολογία της Πληροφορικής μπαίνει στην ζωή μας…Σήμερα ζούμε σε ένα ψηφιακό κόσμο, όπου η τεχνολογία εμπλέκεται πλήρως παρεμβαίνει στην καθημερινότητά μας. Από τα αυτοκίνητα ως τις οικιακές συσκευές, από τα κινητά τηλέφωνα ως τις τηλεοράσεις και από τους χώρους... Περισσότερες Πληροφορίες', 'images/103.png','Computer Vision,Computer Graphics,Parallel Computing,Game Development,Algorithms'),
        ('ΤΟ ΨΗΦΙΑΚΟ ΜΕΛΛΟΝ', 'ΣΙΔΕΡΗΣ Ι.', '978-960-08-0834-6', '420', 'contemporary,comedy,science,finance,technology,sociology,poetry', 'Οι ψηφιακές τεχνολογίες δεν βοηθούν πλέον τις επιχειρήσεις και τους οργανισμούς μόνο για την αύξηση της λειτουργικής αποτελεσματικότητας και διαχειριστικής αποδοτικότητάς τους. Υποστηρίζουν την επιχειρηματική μεταμόρφωσή τους μέσω εκτενών, σχεδιασμένων εκ νέου,... Περισσότερες Πληροφορίες', 'images/104.png','Network Security,Computer Science,Virtual Reality,Database Management,Machine Learning'),
        ('ΜΕΘΟΔΟΛΟΓΙΑ ΕΡΕΥΝΑΣ ΚΑΙ ΣΤΑΤΙΣΤΙΚΗ', 'ΜΟΤΙΒΟ', '978-960-499-299-7', '720', 'art,poetry,health,Greek literature,management,crime', '- Πώς κατάφερνε ο Έξυπνος Χανς, το άλογο, να κάνει μαθηματικές πράξεις; - Τι μας διδάσκει για τη μεθοδολογία έρευνας η τυφλή γευστική δοκιμή ααψυκτικών από ποτήρια με γράμματα Q και M; - Πώς οι λογαριασμοί στο Facebook μετατρέπονται σε πρωτογενή πηγή έρευνας; - Τι είναι η... Περισσότερες Πληροφορίες', 'images/105.png','Robotics Engineering,Big Data,Finite Element Analysis'),
        ('ΜΑΘΑΙΝΕΤΕ ΕΥΚΟΛΑ MICROSOFT OFFICE 2019', 'ΑΒΑΚΑΣ', '978-960-6789-25-0', '944', 'travel,math', 'Το βιβλίο αυτό θα σας διδάξει εύκολα και γρήγορα, όλα όσα χρειάζεστε για να εκμεταλλευτείτε τις ισχυρές δυνατότητες του Microsoft Office 2019.Εκτός από την αναλυτική κάλυψη των εφαρμογών του πακέτου (Word, Excel, Access και PowerPoint), καλύπτει τις βασικές έννοιες των Η/Υ, τη χρήση των Windows 10 και... Περισσότερες Πληροφορίες', 'images/106.png','Internet of Things,Database Systems,Web Development,Computer Security,Artificial Neural Networks,Image Processing,Artificial Intelligence'),
        ('ΜΗΧΑΝΙΚΗ ΜΑΘΗΣΗ', 'ΚΛΕΙΔΑΡΙΘΜΟΣ', '978-960-461-995-5', '792', 'technology,crime,romance', 'Η Μηχανική Μάθηση αποτελεί ίσως τον πιο ραγδαία αναπτυσσόμενο τομέα της Τεχνητής Νοημοσύνης καθώς τα τελευταία χρόνια, ειδικά μετά την έλευση της Βαθιάς Μάθησης, έχει προσφέρει πληθώρα μεθόδων με πολύ καλά έως εντυπωσιακά αποτελέσματα σε όλες σχεδόν τις εφαρμογές που... Περισσότερες Πληροφορίες', 'images/107.png','Embedded Systems'),
        ('ΣΥΣΤΗΜΑΤΑ ΥΠΟΛΟΓΙΣΤΩΝ', 'ΚΛΕΙΔΑΡΙΘΜΟΣ', '978-960-461-953-5', '1032', 'comedy,thriller,adventure,autobiography,technology,history', 'Το βιβλίο Συστήματα υπολογιστών: Μια προσέγγιση από την πλευρά του προγραμματιστή εισάγει τους αναγνώστες στις σημαντικές και διαχρονικές έννοιες στις οποίες βασίζονται τα υπολογιστικά συστήματα, δείχνοντας με τι τρόπο αυτές οι έννοιες επηρεάζουν την ορθότητα, την... Περισσότερες Πληροφορίες', 'images/108.png','Control Engineering,Database Management,Programming Languages,Data Mining'),
        ('ΨΗΦΙΑΚΗ ΣΧΕΔΙΑΣΗ', 'ΚΛΕΙΔΑΡΙΘΜΟΣ', '978-960-645-001-3', '1048', 'mystery,Greek literature', 'Το βιβλίο Ψηφιακή σχεδίαση – Αρχές και πρακτικές θα σας βοηθήσει να αποκτήσετε τις βασικές γνώσεις που χρειάζεστε στο υψηλό επίπεδο (γλώσσες HDL, με έμφαση στη Verilog), στο χαμηλό επίπεδο (ηλεκτρικά κυκλώματα), και στο «απέραντο ενδιάμεσο» που περιλαμβάνει τις πύλες, τα... Περισσότερες Πληροφορίες', 'images/109.png','Artificial Intelligence,Electronics'),
        ('Η ΕΠΙΣΤΗΜΗ ΤΩΝ ΔΕΔΟΜΕΝΩΝ ΓΙΑ ΕΠΙΧΕΙΡΗΣΕΙΣ', 'ΚΛΕΙΔΑΡΙΘΜΟΣ', '978-960-461-991-7', '528', 'autobiography,comic,art,science fiction,science,children’s', 'Αυτός ο εκτενής και αναλυτικός οδηγός παρουσιάζει τις θεμελιώδεις αρχές της επιστήμης των δεδομένων χωρίς εξεζητημένες τεχνικές λεπτομέρειες, και σας καθοδηγεί βήμα προς βήμα στη μεθοδολογία της αναλυτικής δεδομένων για την εξαγωγή χρήσιμων στοιχείων και την άντληση... Περισσότερες Πληροφορίες', 'images/110.png','Internet of Things,Network Security'),
        ('ΤΟ ΒΙΒΛΙΟ ΤΗΣ PYTHON ΓΡΑΦΟΝΤΑΣ ΚΩΔΙΚΑ', 'ΚΡΙΤΙΚΗ', '978-960-586-312-8', '590', 'science,adventure,romance,education,sociology,technology', 'Το "Βιβλίο της Python" είναι ένα πλήρες εγχειρίδιο αναφοράς για την εκμάθηση της γλώσσας. Ξεκινάει από τα πιο βασικά στοιχεία που χρειάζεται να μάθει κάποιος ο οποίος ασχολείται για πρώτη φορά με τον προγραμματισμό και προχωράει σε βάθος, σε κάθε πτυχή της γλώσσας και σε πιο... Περισσότερες Πληροφορίες', 'images/111.png','Computer Animation,Numerical Analysis,Computer Ethics,Computer Programming,Computer Organization,Cybersecurity'),
        ('ΨΗΦΙΑΚΗ ΣΧΕΔΙΑΣΗ ΚΑΙ ΑΡΧΙΤΕΚΤΟΝΙΚΗ ΥΠΟΛΟΓΙΣΤΩΝ', 'ΚΛΕΙΔΑΡΙΘΜΟΣ', '978-960-461-961-0', '704', 'science fiction', 'Ξεκινώντας από τις ψηφιακές λογικές πύλες και προχωρώντας σταδιακά στη σχεδίαση συνδυαστικών και ακολουθιακών κυκλωμάτων, οι Harris και Harris χρησιμοποιούν αυτά τα θεμελιώδη δομικά στοιχεία ως βάση για τη σχεδίαση ενός πραγματικού επεξεργαστή ARM, κάτι που, με δεδομένο ότι... Περισσότερες Πληροφορίες', 'images/112.png','Computer Science,Control Engineering,Mathematical Modeling,Cryptography,Information Retrieval'),
        ('ΣΥΣΤΗΜΑΤΑ ΒΑΣΕΩΝ ΔΕΔΟΜΕΝΩΝ', 'ΔΙΣΙΓΜΑ ΕΚΔΟΣΕΙΣ', '978-618-5242-58-9', '580', 'crime,sociology', 'Το βιβλίο αυτό παρουσιάζει όσο γίνεται πιο απλά τις βασικές έννοιες τη διαχείρισης βάσεων δεδομένων και ποια είναι τα πλεονεκτήματα της χρήσης μίας σχεσιακής βάσης δεδομένων έναντι της χρήσης απλών αρχείων ή λογιστικών φύλλων. Βασικός σκοπός αυτού του βιβλίου είναι να... Περισσότερες Πληροφορίες', 'images/113.png','Data Science,Computer Programming,Data Mining,Information Science,Information Retrieval,Robotics Engineering,Web Development,Cryptography,Software Engineering'),
        ('ΔΥΝΑΤΟΤΗΤΕΣ ΚΑΙ ΕΦΑΡΜΟΓΕΣ ΤΟΥ ΠΑΓΚΟΣΜΙΟΥ ΙΣΤΟΥ 2Η ΕΚΔΟΣΗ', 'ΔΙΣΙΓΜΑ ΕΚΔΟΣΕΙΣ', '978-618-5242-65-7', '530', 'science fiction,education,comic', 'Το Διαδίκτυο είναι ένα παγκόσμιο σύστημα διασυνδεδεμένων δικτύων υπολογιστών, που χρησιμοποιούν το πρωτόκολλο TCP / IP για να εξυπηρετήσουν δισεκατομμύρια χρήστες παγκοσμίως. Θεωρείται το δίκτυο των δικτύων και αποτελείται από εκατομμύρια ιδιωτικά, δημόσια,... Περισσότερες Πληροφορίες', 'images/114.png','Image Processing,Neural Networks'),
        ('ΛΥΜΕΝΕΣ ΑΣΚΗΣΕΙΣ C 450 ΛΥΜΕΝΕΣ ΑΣΚΗΣΕΙΣ ΠΛΗΡΩΣ ΣΧΟΛΙΑΣΜΕΝΕΣ', 'ΔΡΑΚΟΠΟΥΛΟΣ ΑΝΑΣΤΑΣΙΟΣ', '960-631-188-0', '468', 'literature,adventure,autobiography,thriller,drama,Greek literature', 'Ένα βιβλίο για την γλώσσα C δεν είναι απαραίτητο να είναι ένα δύσκολο βιβλίο. Το παρόν βιβλίο είναι ένα λειτουργικό και χρήσιμο βοήθημα για την γρήγορη εκμάθηση της γλώσσας C. Η γλώσσα C έχει χρησιμοποιηθεί και χρησιμοποιείται στην Επιστήμη της Πληροφορικής. Διαδραμάτισε... Περισσότερες Πληροφορίες', 'images/115.png','Computer Animation,Database Systems,Computer Science,High Performance Computing,Information Science,Multimedia Computing,Expert Systems,Digital Signal Processing'),
        ('ΕΛΛΗΝΙΚΗ XLOGO', 'ΔΡΑΚΟΠΟΥΛΟΣ ΑΝΑΣΤΑΣΙΟΣ', '978-960-93-2631-5', '200', 'adventure,sociology,comic,travel,science fiction,autobiography,contemporary,thriller', 'Το βιβλίο αυτό έχει σαν στόχο την εισαγωγή σε έναν εξαιρετικό κλώνο της γλώσσας LOGO την XLOGO. Η XLogo είναι μια πολύ φιλική έκδοση της γλώσσας Logo η οποία αν και είναι πολύ εύκολη στην εκμάθησή της, δεν έχει όριο στην πολυπλοκότητα των προγραμμάτων που μπορούμε να δημιουργήσουμε.... Περισσότερες Πληροφορίες', 'images/116.png','High Performance Computing'),
        ('ΔΗΜΙΟΥΡΓΙΑ 3Δ ΜΟΝΤΕΛΩΝ ΜΕ ΤΟ SOLIDWORKS', 'ΚΛΕΙΔΑΡΙΘΜΟΣ', '978-960-461-887-3', '310', 'math,art,technology,literature,education,mystery,classic,children’s,finance', 'Το βιβλίο Δημιουργία 3Δ μοντέλων με το SolidWorks είναι ένας περιεκτικός και αποτελεσματικός οδηγός, σχεδιασμένος και δομημένος ώστε να παρέχει στον αναγνώστη τις απαραίτητες γνώσεις για    αποδοτική χρήση του SolidWorks    δημιουργία και επεξεργασία διδιάστατων σχημάτων   ... Περισσότερες Πληροφορίες', 'images/117.png','Game Development,Computer Networks,Artificial Neural Networks,Cryptography,Operating Systems,Programming Languages,Digital Signal Processing,Expert Systems'),
        ('ΣΤΑΤΙΣΤΙΚΗ ΑΝΑΛΥΣΗ ΔΕΔΟΜΕΝΩΝ ΜΕ ΤΗ ΧΡΗΣΗ ΤΗΣ R', 'ΚΡΙΤΙΚΗ', '978-960-586-309-8', '592', 'autobiography,science fiction', ' Αυτό το βιβλίο αποσκοπεί στην παρουσίαση της στατιστικής με τρόπο ευνόητο για τους φοιτητές, παρέχοντας μια ανασκόπηση περιγραφικής και επαγωγικής στατιστικής για σπουδαστές με λίγες γνώσεις μαθηματικών στα επιστημονικά πεδία των επιστημών που πραγματεύονται τη... Περισσότερες Πληροφορίες', 'images/118.png','Expert Systems,Network Security'),
        ('ΤΕΧΝΗΤΗ ΝΟΗΜΟΣΥΝΗ', 'ΓΚΙΟΥΡΔΑΣ Μ.', '978-9605127138', '248', 'classic,fantasy,drama,Greek literature,health', 'Τεχνητή Νοημοσύνη/Μηχανική ΜάθησηΜάθετε όλα όσα χρειάζεστε για έτοιμες λύσεις τεχνητής νοημοσύνης και μηχανικής μάθησηςΤο βιβλίο Τεχνητή νοημοσύνη, Μια πραγματολογική ανάλυση θα σας βοηθήσει να λύσετε πραγματικά προβλήματα με σύγχρονα εργαλεία μηχανικής μάθησης,... Περισσότερες Πληροφορίες', 'images/119.png','Neuroscience,Expert Systems,Optimization,Computational Science,Robotics Engineering,Internet of Things,Big Data');

#Writers
INSERT INTO writer (first_name, last_name) VALUES ('ΝΤΑΓΚΛΑΣ', 'ΚΟΜΕΡ');
INSERT INTO writer (first_name, last_name) VALUES ('ΣΤΕΛΙΟΣ', 'ΑΝΤΩΝΟΠΟΥΛΟΣ');
INSERT INTO writer (first_name, last_name) VALUES ('ΧΑΡΟΥ', 'ΑΓΚΑΡΒΑΛ');
INSERT INTO writer (first_name, last_name) VALUES ('ΠΑΟΥΛ', 'ΝΤΕΙΤΕΛ');
INSERT INTO writer (first_name, last_name) VALUES ('ΧΕΡΒΙ', 'ΝΤΕΙΤΕΛ');
INSERT INTO writer (first_name, last_name) VALUES ('Ι.', 'ΚΥΡΙΑΖΟΓΛΟΥ');
INSERT INTO writer (first_name, last_name) VALUES ('ΓΙΑΝΝΗΣ', 'ΚΑΠΠΟΣ');
INSERT INTO writer (first_name, last_name) VALUES ('ΒΑΛΙΑ', 'ΚΑΙΜΑΚΗ');
INSERT INTO writer (first_name, last_name) VALUES ('ΕΥΑΓΓΕΛΙΑ', 'ΤΖΙΑΚΑ');
INSERT INTO writer (first_name, last_name) VALUES ('ΜΑΙΡΗ', 'ΓΚΛΑΒΑ');
INSERT INTO writer (first_name, last_name) VALUES ('ΜΑΡΙΑ', 'ΤΣΙΡΙΝΤΑΝΗ');
INSERT INTO writer (first_name, last_name) VALUES ('ΧΑΡΙΤΩΝ', 'ΚΥΠΡΙΑΝΟΣ');
INSERT INTO writer (first_name, last_name) VALUES ('ΑΝΑΣΤΑΣΙΟΣ', 'ΔΡΑΚΟΠΟΥΛΟΣ');
INSERT INTO writer (first_name, last_name) VALUES ('ΕΡΓΟ', 'ΣΥΛΛΟΓΙΚΟ');
INSERT INTO writer (first_name, last_name) VALUES ('Β.ΤΖΟΝ', 'ΓΚΟΥΤΑΓΚ');
INSERT INTO writer (first_name, last_name) VALUES ('ΤΖΩΝ', 'ΛΙΟΥΙΣ');
INSERT INTO writer (first_name, last_name) VALUES ('ΝΕΛ', 'ΝΤΕΙΛ');
INSERT INTO writer (first_name, last_name) VALUES ('Ι.', 'ΑΠΟΣΤΟΛΑΚΗΣ');
INSERT INTO writer (first_name, last_name) VALUES ('Τ.', 'ΔΑΡΑΣ');
INSERT INTO writer (first_name, last_name) VALUES ('Μ.Α.', 'ΣΤΑΜΟΥΛΗ');
INSERT INTO writer (first_name, last_name) VALUES ('ΝΙΚΟΛΑΟΣ', 'ΚΟΥΤΣΟΥΠΙΑΣ');
INSERT INTO writer (first_name, last_name) VALUES ('ΚΕΝΤΑΛ', 'ΜΑΡΤΙΝ');
INSERT INTO writer (first_name, last_name) VALUES ('ΑΛΑΝ', 'ΕΒΑΝΣ');
INSERT INTO writer (first_name, last_name) VALUES ('ΜΑΙΡΗ ΑΝΝ', 'ΠΟΑΤΣΥ');
INSERT INTO writer (first_name, last_name) VALUES ('ΤΑΝΙΑ', 'ΓΚΟΥΝΤΙΝ');
INSERT INTO writer (first_name, last_name) VALUES ('ΚΩΝΣΤΑΝΤΙΝΟΣ', 'ΞΑΡΧΑΚΟΣ');
INSERT INTO writer (first_name, last_name) VALUES ('ΜΑΝΩΛΗΣ', 'ΜΑΡΚΑΤΣΕΛΑΣ');
INSERT INTO writer (first_name, last_name) VALUES ('Π.ΦΩΤΗΣ', 'ΚΑΡΑΜΠΑΤΖΑΚΗΣ');
INSERT INTO writer (first_name, last_name) VALUES ('Π.ΔΗΜΗΤΡΗΣ', 'ΚΑΡΑΜΠΑΤΖΑΚΗΣ');
INSERT INTO writer (first_name, last_name) VALUES ('ΚΑΘΡΙΝ', 'ΝΤΟΟΥΣΟΝ');
INSERT INTO writer (first_name, last_name) VALUES ('ΜΑΝΩΛΗΣ', 'ΑΝΔΡΙΩΤΑΚΗΣ');
INSERT INTO writer (first_name, last_name) VALUES ('ΣΤΕΛΙΟΣ', 'ΣΤΥΛΙΑΝΙΔΗΣ');
INSERT INTO writer (first_name, last_name) VALUES ('ΧΑΝΤΛΕΙ', 'ΓΟΥΙΚΑΜ');
INSERT INTO writer (first_name, last_name) VALUES ('ΓΚΑΡΕΤ', 'ΓΚΡΟΜΕΛΟΥΝΤ');
INSERT INTO writer (first_name, last_name) VALUES ('Σ.ΑΡΙΣΤΕΙΔΗΣ', 'ΜΠΟΥΡΑΣ');
INSERT INTO writer (first_name, last_name) VALUES ('ΑΡΓΥΡΗΣ', 'ΚΟΥΡΕΑΣ');
INSERT INTO writer (first_name, last_name) VALUES ('ΚΩΝΣΤΑΝΤΙΝΟΣ', 'ΝΑΤΣΙΚΑΣ');
INSERT INTO writer (first_name, last_name) VALUES ('ΑΛΚΙΒΙΑΔΗΣ', 'ΤΣΙΜΠΙΡΗΣ');
INSERT INTO writer (first_name, last_name) VALUES ('ΓΕΩΡΓΙΟΣ', 'ΝΙΚΟΛΑΟΥ');
INSERT INTO writer (first_name, last_name) VALUES ('ΠΑΝΑΓΙΩΤΗΣ Ε.', 'ΤΖΑΒΑΡΑΣ');
INSERT INTO writer (first_name, last_name) VALUES ('ΕΡΙΚΑ', 'ΝΤΑΒΑΝ');
INSERT INTO writer (first_name, last_name) VALUES ('ΜΙΧΑΛΗΣ', 'ΞΕΝΟΣ');
INSERT INTO writer (first_name, last_name) VALUES ('ΔΗΜΗΤΡΗΣ', 'ΧΡΙΣΤΟΔΟΥΛΑΚΗΣ');
INSERT INTO writer (first_name, last_name) VALUES ('ΓΙΩΡΓΟΣ', 'ΛΙΑΚΕΑΣ');
INSERT INTO writer (first_name, last_name) VALUES ('ΣΤΙΟΥΑΡΤ', 'ΡΑΣΕΛ');
INSERT INTO writer (first_name, last_name) VALUES ('ΠΙΤΕΡ', 'ΝΟΡΒΙΓΚ');
INSERT INTO writer (first_name, last_name) VALUES ('ΤΖΟΕΛ', 'ΓΚΡΟΥΣ');
INSERT INTO writer (first_name, last_name) VALUES ('ΔΗΜΗΤΡΙΟΣ', 'ΚΑΡΟΛΙΔΗΣ');
INSERT INTO writer (first_name, last_name) VALUES ('ΦΩΤΗΣ', 'ΛΑΖΑΡΙΝΗΣ');
INSERT INTO writer (first_name, last_name) VALUES ('ΒΑΣΙΛΕΙΟΣ', 'ΚΑΡΒΟΥΝΙΑΡΗΣ');
INSERT INTO writer (first_name, last_name) VALUES ('ΕΛΕΑΝΑ', 'ΠΑΝΔΙΑ');
INSERT INTO writer (first_name, last_name) VALUES ('ΑΛΕΞΑΝΔΡΟΣ', 'ΣΧΙΣΜΕΝΟΣ');
INSERT INTO writer (first_name, last_name) VALUES ('ΕΥΑΓΓΕΛΟΣ', 'ΚΕΧΡΗΣ');
INSERT INTO writer (first_name, last_name) VALUES ('', 'ΒΟΥΤΣΙΔΟΥ');
INSERT INTO writer (first_name, last_name) VALUES ('ΣΟΦΙΑ', 'ΜΙΧΑΗΛΙΔΟΥ');
INSERT INTO writer (first_name, last_name) VALUES ('ΑΝΑΣΤΑΣΙΟΣ', 'ΚΟΛΛΙΑΣ');
INSERT INTO writer (first_name, last_name) VALUES ('ΑΘΗΝΑ', 'ΛΑΖΑΚΙΔΟΥ');
INSERT INTO writer (first_name, last_name) VALUES ('', 'ΝΙΛ');
INSERT INTO writer (first_name, last_name) VALUES ('ΚΑΘΙ', 'Ο');
INSERT INTO writer (first_name, last_name) VALUES ('ΘΑΝΑΣΗΣ', 'ΔΑΒΑΛΑΣ');
INSERT INTO writer (first_name, last_name) VALUES ('ΑΝΝΑ', 'ΑΓΓΕΛΑΚΗ');
INSERT INTO writer (first_name, last_name) VALUES ('ΜΑΡΙΑ', 'ΤΑΒΟΥΛΑΡΗ');
INSERT INTO writer (first_name, last_name) VALUES ('ΒΙΚΤΩΡ', 'ΓΑΣΠΑΡΑΚΗΣ');
INSERT INTO writer (first_name, last_name) VALUES ('ΕΥΑΓΓΕΛΟΣ', 'ΤΖΑΝΙΔΗΣ');
INSERT INTO writer (first_name, last_name) VALUES ('Δ.', 'ΚΑΡΟΛΙΔΗΣ');
INSERT INTO writer (first_name, last_name) VALUES ('ΣΤΕΦΑΝΙ', 'ΜΙΛΤΟΝ');
INSERT INTO writer (first_name, last_name) VALUES ('ΘΕΟΔΟΣΗΣ', 'ΘΕΟΔΟΣΙΟΥ');
INSERT INTO writer (first_name, last_name) VALUES ('ΓΙΑΝΝΗΣ', 'ΤΟΛΙΟΣ');
INSERT INTO writer (first_name, last_name) VALUES ('Χ.', 'ΝΤΙΤΕΛ');
INSERT INTO writer (first_name, last_name) VALUES ('Π.', 'ΝΤΙΤΕΛ');
INSERT INTO writer (first_name, last_name) VALUES ('ΝΤΕΙΒ', 'ΧΑΡΛΕΥ');
INSERT INTO writer (first_name, last_name) VALUES ('ΤΖΟΥΛΙ', 'ΜΟΡΓΚΑΝ');
INSERT INTO writer (first_name, last_name) VALUES ('ΧΑΝΝΑ', 'ΦΡΙΘ');
INSERT INTO writer (first_name, last_name) VALUES ('ΓΙΑΝΝΗΣ', 'ΤΣΑΟΥΣΗΣ');
INSERT INTO writer (first_name, last_name) VALUES ('Λ. ΠΕΤΡΟΣ', 'ΡΟΥΣΣΟΣ');
INSERT INTO writer (first_name, last_name) VALUES ('ΜΑΡΙΑ', 'ΣΥΜΕΩΝΑΚΗ');
INSERT INTO writer (first_name, last_name) VALUES ('ΔΗΜΗΤΡΗΣ', 'ΚΑΒΡΟΥΔΑΚΗΣ');
INSERT INTO writer (first_name, last_name) VALUES ('ΕΜ.ΓΕΩΡΓΙΟΣ', 'ΧΑΛΚΟΣ');
INSERT INTO writer (first_name, last_name) VALUES ('ΙΩΣΗΦ', 'ΣΗΦΑΚΗΣ');
INSERT INTO writer (first_name, last_name) VALUES ('ΕΡΙΚ', 'ΜΑΘΙΣ');
INSERT INTO writer (first_name, last_name) VALUES ('Κ.', 'ΞΑΡΧΑΚΟΣ');
INSERT INTO writer (first_name, last_name) VALUES ('ΝΤΙΝ', 'ΑΛΕΜΑΝΓΚ');
INSERT INTO writer (first_name, last_name) VALUES ('ΤΖΙΜ', 'ΧΕΝΤΛΕΡ');
INSERT INTO writer (first_name, last_name) VALUES ('ΣΤΑΥΡΟΣ', 'ΒΑΛΣΑΜΙΔΗΣ');
INSERT INTO writer (first_name, last_name) VALUES ('ΙΩΑΝΝΗΣ', 'ΚΑΖΑΝΙΔΗΣ');
INSERT INTO writer (first_name, last_name) VALUES ('ΤΕΡΙ', 'ΓΚΡΙΦΙΝ');
INSERT INTO writer (first_name, last_name) VALUES ('ΔΗΜΗΤΡΗΣ', 'ΠΟΓΑΡΙΔΗΣ');
INSERT INTO writer (first_name, last_name) VALUES ('ΚΩΝΣΤΑΝΤΙΝΟΣ', 'ΚΟΥΝΕΤΑΣ');
INSERT INTO writer (first_name, last_name) VALUES ('ΝΙΚΟΛΑΟΣ', 'ΧΑΤΖΗΣΤΑΜΟΥΛΟΥ');
INSERT INTO writer (first_name, last_name) VALUES ('ΤΖΕΙΜΣ', 'ΜΠΡΙΝΤΛ');
INSERT INTO writer (first_name, last_name) VALUES ('ΝΤΕΙΒΙΝΤ', 'ΠΑΤΕΡΣΟΝ');
INSERT INTO writer (first_name, last_name) VALUES ('ΤΖΟΝ', 'ΧΕΝΕΣΙ');
INSERT INTO writer (first_name, last_name) VALUES ('ΧΑΝΑ', 'ΦΡΑΙ');
INSERT INTO writer (first_name, last_name) VALUES ('ΙΩΑΝΝΗΣ', 'ΑΠΟΣΤΟΛΑΚΗΣ');
INSERT INTO writer (first_name, last_name) VALUES ('ΗΡΑΚΛΗΣ', 'ΒΑΡΛΑΜΗΣ');
INSERT INTO writer (first_name, last_name) VALUES ('ΤΖΟΑΝ', 'ΛΑΜΠΕΡΤ');
INSERT INTO writer (first_name, last_name) VALUES ('ΚΟΥΡΤΙΣ', 'ΦΡΑΙ');
INSERT INTO writer (first_name, last_name) VALUES ('ΑΠΟΣΤΟΛΟΣ', 'ΣΥΡΟΠΟΥΛΟΣ');
INSERT INTO writer (first_name, last_name) VALUES ('ΑΝΑΣΤΑΣΙΟΣ', 'ΔΗΜΟΥ');
INSERT INTO writer (first_name, last_name) VALUES ('ΘΕΟΔΩΡΟΣ', 'ΚΑΣΚΑΛΗΣ');
INSERT INTO writer (first_name, last_name) VALUES ('ΧΡΙΣΤΟΦΟΡΟΣ', 'ΝΙΚΟΛΑΟΥ');
INSERT INTO writer (first_name, last_name) VALUES ('ΤΖΟΡΤΖ', 'ΜΠΙΚΜΑΝ');
INSERT INTO writer (first_name, last_name) VALUES ('ΜΠΕΝ', 'ΜΠΙΚΜΑΝ');
INSERT INTO writer (first_name, last_name) VALUES ('ΑΝΑΣΤΑΣΙΟΣ', 'ΣΤΑΛΙΚΑΣ');
INSERT INTO writer (first_name, last_name) VALUES ('ΘΕΟΔΩΡΟΣ', 'ΚΥΡΙΑΖΟΣ');
INSERT INTO writer (first_name, last_name) VALUES ('ΔΗΜΗΤΡΙΟΣ', 'ΜΠΟΤΣΗΣ');
INSERT INTO writer (first_name, last_name) VALUES ('ΚΩΝΣΤΑΝΤΙΝΟΣ', 'ΔΙΑΜΑΝΤΑΡΑΣ');
INSERT INTO writer (first_name, last_name) VALUES ('ΡΑΝΤΑΛ', 'ΜΠΡΑΙΑΝΤ');
INSERT INTO writer (first_name, last_name) VALUES ('ΤΖΟΝ', 'ΟΥΑΚΕΡΛΥ');
INSERT INTO writer (first_name, last_name) VALUES ('ΦΟΣΤΕΡ', 'ΠΡΟΒΟΣΤ');
INSERT INTO writer (first_name, last_name) VALUES ('ΤΟΜ', 'ΦΟΣΕΤ');
INSERT INTO writer (first_name, last_name) VALUES ('ΝΙΚΟΛΑΟΣ', 'ΣΑΜΑΡΑΣ');
INSERT INTO writer (first_name, last_name) VALUES ('ΚΩΝΣΤΑΝΤΙΝΟΣ', 'ΤΣΙΠΛΙΔΗΣ');
INSERT INTO writer (first_name, last_name) VALUES ('ΝΤΕΙΒΙΝΤ', 'ΧΑΡΙΣ');
INSERT INTO writer (first_name, last_name) VALUES ('ΣΑΡΑ', 'ΧΑΡΙΣ');
INSERT INTO writer (first_name, last_name) VALUES ('ΓΕΩΡΓΙΑ', 'ΧΑΡΙΤΟΥΔΗ');
INSERT INTO writer (first_name, last_name) VALUES ('ΚΩΝΣΤΑΝΤΙΝΟΣ', 'ΣΑΠΑΛΙΔΗΣ');
INSERT INTO writer (first_name, last_name) VALUES ('ΝΟΑ', 'ΓΚΙΦΤ');

#Book Writers
INSERT INTO book_writer (book_id, writer_id) VALUES ('1', '1');
INSERT INTO book_writer (book_id, writer_id) VALUES ('2', '2');
INSERT INTO book_writer (book_id, writer_id) VALUES ('3', '3');
INSERT INTO book_writer (book_id, writer_id) VALUES ('4', '4');
INSERT INTO book_writer (book_id, writer_id) VALUES ('4', '5');
INSERT INTO book_writer (book_id, writer_id) VALUES ('5', '6');
INSERT INTO book_writer (book_id, writer_id) VALUES ('6', '7');
INSERT INTO book_writer (book_id, writer_id) VALUES ('7', '8');
INSERT INTO book_writer (book_id, writer_id) VALUES ('8', '9');
INSERT INTO book_writer (book_id, writer_id) VALUES ('9', '10');
INSERT INTO book_writer (book_id, writer_id) VALUES ('10', '11');
INSERT INTO book_writer (book_id, writer_id) VALUES ('11', '12');
INSERT INTO book_writer (book_id, writer_id) VALUES ('12', '13');
INSERT INTO book_writer (book_id, writer_id) VALUES ('13', '13');
INSERT INTO book_writer (book_id, writer_id) VALUES ('14', '13');
INSERT INTO book_writer (book_id, writer_id) VALUES ('15', '14');
INSERT INTO book_writer (book_id, writer_id) VALUES ('16', '14');
INSERT INTO book_writer (book_id, writer_id) VALUES ('17', '15');
INSERT INTO book_writer (book_id, writer_id) VALUES ('18', '14');
INSERT INTO book_writer (book_id, writer_id) VALUES ('19', '16');
INSERT INTO book_writer (book_id, writer_id) VALUES ('19', '17');
INSERT INTO book_writer (book_id, writer_id) VALUES ('20', '14');
INSERT INTO book_writer (book_id, writer_id) VALUES ('21', '18');
INSERT INTO book_writer (book_id, writer_id) VALUES ('21', '19');
INSERT INTO book_writer (book_id, writer_id) VALUES ('21', '20');
INSERT INTO book_writer (book_id, writer_id) VALUES ('22', '14');
INSERT INTO book_writer (book_id, writer_id) VALUES ('23', '21');
INSERT INTO book_writer (book_id, writer_id) VALUES ('24', '14');
INSERT INTO book_writer (book_id, writer_id) VALUES ('25', '22');
INSERT INTO book_writer (book_id, writer_id) VALUES ('25', '23');
INSERT INTO book_writer (book_id, writer_id) VALUES ('25', '24');
INSERT INTO book_writer (book_id, writer_id) VALUES ('26', '25');
INSERT INTO book_writer (book_id, writer_id) VALUES ('27', '26');
INSERT INTO book_writer (book_id, writer_id) VALUES ('27', '27');
INSERT INTO book_writer (book_id, writer_id) VALUES ('28', '14');
INSERT INTO book_writer (book_id, writer_id) VALUES ('29', '28');
INSERT INTO book_writer (book_id, writer_id) VALUES ('29', '29');
INSERT INTO book_writer (book_id, writer_id) VALUES ('30', '14');
INSERT INTO book_writer (book_id, writer_id) VALUES ('31', '30');
INSERT INTO book_writer (book_id, writer_id) VALUES ('32', '31');
INSERT INTO book_writer (book_id, writer_id) VALUES ('33', '14');
INSERT INTO book_writer (book_id, writer_id) VALUES ('34', '32');
INSERT INTO book_writer (book_id, writer_id) VALUES ('35', '33');
INSERT INTO book_writer (book_id, writer_id) VALUES ('35', '34');
INSERT INTO book_writer (book_id, writer_id) VALUES ('36', '35');
INSERT INTO book_writer (book_id, writer_id) VALUES ('37', '36');
INSERT INTO book_writer (book_id, writer_id) VALUES ('37', '37');
INSERT INTO book_writer (book_id, writer_id) VALUES ('37', '38');
INSERT INTO book_writer (book_id, writer_id) VALUES ('38', '2');
INSERT INTO book_writer (book_id, writer_id) VALUES ('38', '39');
INSERT INTO book_writer (book_id, writer_id) VALUES ('39', '40');
INSERT INTO book_writer (book_id, writer_id) VALUES ('40', '14');
INSERT INTO book_writer (book_id, writer_id) VALUES ('41', '41');
INSERT INTO book_writer (book_id, writer_id) VALUES ('42', '42');
INSERT INTO book_writer (book_id, writer_id) VALUES ('42', '43');
INSERT INTO book_writer (book_id, writer_id) VALUES ('43', '44');
INSERT INTO book_writer (book_id, writer_id) VALUES ('44', '45');
INSERT INTO book_writer (book_id, writer_id) VALUES ('44', '46');
INSERT INTO book_writer (book_id, writer_id) VALUES ('45', '7');
INSERT INTO book_writer (book_id, writer_id) VALUES ('46', '7');
INSERT INTO book_writer (book_id, writer_id) VALUES ('47', '14');
INSERT INTO book_writer (book_id, writer_id) VALUES ('48', '47');
INSERT INTO book_writer (book_id, writer_id) VALUES ('49', '48');
INSERT INTO book_writer (book_id, writer_id) VALUES ('50', '49');
INSERT INTO book_writer (book_id, writer_id) VALUES ('50', '50');
INSERT INTO book_writer (book_id, writer_id) VALUES ('51', '51');
INSERT INTO book_writer (book_id, writer_id) VALUES ('52', '52');
INSERT INTO book_writer (book_id, writer_id) VALUES ('53', '53');
INSERT INTO book_writer (book_id, writer_id) VALUES ('54', '14');
INSERT INTO book_writer (book_id, writer_id) VALUES ('55', '54');
INSERT INTO book_writer (book_id, writer_id) VALUES ('55', '55');
INSERT INTO book_writer (book_id, writer_id) VALUES ('56', '56');
INSERT INTO book_writer (book_id, writer_id) VALUES ('57', '57');
INSERT INTO book_writer (book_id, writer_id) VALUES ('58', '58');
INSERT INTO book_writer (book_id, writer_id) VALUES ('58', '59');
INSERT INTO book_writer (book_id, writer_id) VALUES ('59', '60');
INSERT INTO book_writer (book_id, writer_id) VALUES ('59', '61');
INSERT INTO book_writer (book_id, writer_id) VALUES ('59', '62');
INSERT INTO book_writer (book_id, writer_id) VALUES ('59', '63');
INSERT INTO book_writer (book_id, writer_id) VALUES ('59', '64');
INSERT INTO book_writer (book_id, writer_id) VALUES ('60', '65');
INSERT INTO book_writer (book_id, writer_id) VALUES ('61', '66');
INSERT INTO book_writer (book_id, writer_id) VALUES ('62', '10');
INSERT INTO book_writer (book_id, writer_id) VALUES ('63', '67');
INSERT INTO book_writer (book_id, writer_id) VALUES ('64', '68');
INSERT INTO book_writer (book_id, writer_id) VALUES ('65', '4');
INSERT INTO book_writer (book_id, writer_id) VALUES ('65', '5');
INSERT INTO book_writer (book_id, writer_id) VALUES ('66', '10');
INSERT INTO book_writer (book_id, writer_id) VALUES ('67', '10');
INSERT INTO book_writer (book_id, writer_id) VALUES ('68', '10');
INSERT INTO book_writer (book_id, writer_id) VALUES ('69', '10');
INSERT INTO book_writer (book_id, writer_id) VALUES ('70', '10');
INSERT INTO book_writer (book_id, writer_id) VALUES ('71', '69');
INSERT INTO book_writer (book_id, writer_id) VALUES ('71', '70');
INSERT INTO book_writer (book_id, writer_id) VALUES ('72', '71');
INSERT INTO book_writer (book_id, writer_id) VALUES ('72', '72');
INSERT INTO book_writer (book_id, writer_id) VALUES ('72', '73');
INSERT INTO book_writer (book_id, writer_id) VALUES ('73', '74');
INSERT INTO book_writer (book_id, writer_id) VALUES ('73', '75');
INSERT INTO book_writer (book_id, writer_id) VALUES ('74', '76');
INSERT INTO book_writer (book_id, writer_id) VALUES ('75', '77');
INSERT INTO book_writer (book_id, writer_id) VALUES ('76', '78');
INSERT INTO book_writer (book_id, writer_id) VALUES ('77', '79');
INSERT INTO book_writer (book_id, writer_id) VALUES ('78', '80');
INSERT INTO book_writer (book_id, writer_id) VALUES ('79', '10');
INSERT INTO book_writer (book_id, writer_id) VALUES ('80', '65');
INSERT INTO book_writer (book_id, writer_id) VALUES ('80', '81');
INSERT INTO book_writer (book_id, writer_id) VALUES ('81', '82');
INSERT INTO book_writer (book_id, writer_id) VALUES ('81', '83');
INSERT INTO book_writer (book_id, writer_id) VALUES ('82', '84');
INSERT INTO book_writer (book_id, writer_id) VALUES ('82', '85');
INSERT INTO book_writer (book_id, writer_id) VALUES ('83', '86');
INSERT INTO book_writer (book_id, writer_id) VALUES ('84', '87');
INSERT INTO book_writer (book_id, writer_id) VALUES ('85', '14');
INSERT INTO book_writer (book_id, writer_id) VALUES ('86', '14');
INSERT INTO book_writer (book_id, writer_id) VALUES ('87', '88');
INSERT INTO book_writer (book_id, writer_id) VALUES ('87', '89');
INSERT INTO book_writer (book_id, writer_id) VALUES ('88', '90');
INSERT INTO book_writer (book_id, writer_id) VALUES ('89', '91');
INSERT INTO book_writer (book_id, writer_id) VALUES ('89', '92');
INSERT INTO book_writer (book_id, writer_id) VALUES ('90', '69');
INSERT INTO book_writer (book_id, writer_id) VALUES ('90', '70');
INSERT INTO book_writer (book_id, writer_id) VALUES ('91', '13');
INSERT INTO book_writer (book_id, writer_id) VALUES ('92', '13');
INSERT INTO book_writer (book_id, writer_id) VALUES ('93', '13');
INSERT INTO book_writer (book_id, writer_id) VALUES ('94', '13');
INSERT INTO book_writer (book_id, writer_id) VALUES ('95', '93');
INSERT INTO book_writer (book_id, writer_id) VALUES ('96', '87');
INSERT INTO book_writer (book_id, writer_id) VALUES ('97', '94');
INSERT INTO book_writer (book_id, writer_id) VALUES ('97', '95');
INSERT INTO book_writer (book_id, writer_id) VALUES ('98', '96');
INSERT INTO book_writer (book_id, writer_id) VALUES ('98', '97');
INSERT INTO book_writer (book_id, writer_id) VALUES ('99', '26');
INSERT INTO book_writer (book_id, writer_id) VALUES ('100', '98');
INSERT INTO book_writer (book_id, writer_id) VALUES ('100', '99');
INSERT INTO book_writer (book_id, writer_id) VALUES ('101', '100');
INSERT INTO book_writer (book_id, writer_id) VALUES ('102', '101');
INSERT INTO book_writer (book_id, writer_id) VALUES ('103', '87');
INSERT INTO book_writer (book_id, writer_id) VALUES ('104', '102');
INSERT INTO book_writer (book_id, writer_id) VALUES ('104', '103');
INSERT INTO book_writer (book_id, writer_id) VALUES ('105', '14');
INSERT INTO book_writer (book_id, writer_id) VALUES ('106', '104');
INSERT INTO book_writer (book_id, writer_id) VALUES ('106', '105');
INSERT INTO book_writer (book_id, writer_id) VALUES ('107', '81');
INSERT INTO book_writer (book_id, writer_id) VALUES ('107', '65');
INSERT INTO book_writer (book_id, writer_id) VALUES ('108', '106');
INSERT INTO book_writer (book_id, writer_id) VALUES ('108', '107');
INSERT INTO book_writer (book_id, writer_id) VALUES ('109', '108');
INSERT INTO book_writer (book_id, writer_id) VALUES ('110', '109');
INSERT INTO book_writer (book_id, writer_id) VALUES ('111', '110');
INSERT INTO book_writer (book_id, writer_id) VALUES ('111', '111');
INSERT INTO book_writer (book_id, writer_id) VALUES ('112', '112');
INSERT INTO book_writer (book_id, writer_id) VALUES ('112', '113');
INSERT INTO book_writer (book_id, writer_id) VALUES ('113', '114');
INSERT INTO book_writer (book_id, writer_id) VALUES ('113', '115');
INSERT INTO book_writer (book_id, writer_id) VALUES ('114', '10');
INSERT INTO book_writer (book_id, writer_id) VALUES ('115', '116');
INSERT INTO book_writer (book_id, writer_id) VALUES ('115', '117');
INSERT INTO book_writer (book_id, writer_id) VALUES ('116', '13');
INSERT INTO book_writer (book_id, writer_id) VALUES ('117', '13');
INSERT INTO book_writer (book_id, writer_id) VALUES ('118', '7');
INSERT INTO book_writer (book_id, writer_id) VALUES ('119', '14');
INSERT INTO book_writer (book_id, writer_id) VALUES ('120', '118');
