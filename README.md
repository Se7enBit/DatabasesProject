# DatabasesProject

Databases Semester Project

Αυτη τη στιγμη το login έχει ένα θεματάκι (πολλά) αλλά οι ήδη υπάρχοντες users έχουν τους κωδικούς τους αποθηκευμένους σε κανονική μορφή ενώ για ασφάλεια εμείς έχουμε βάλει στο sign up να γίνεται generate_password_hash οπότε δεν είναι συμβατοί οι κωδικοί και ο έλεγχος επιστρέφει None. Θα αφαιρέσω για αρψή τον έλεγχο με το hash, να τσεκάρει απλά ότι το password με το attribute του user: userpassword κάνουν match.
