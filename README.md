# DatabasesProject

Databases Semester Project

Αυτη τη στιγμη το login έχει ένα θεματάκι (πολλά) αλλά οι ήδη υπάρχοντες users έχουν τους κωδικούς τους αποθηκευμένους σε κανονική μορφή ενώ για ασφάλεια εμείς έχουμε βάλει στο sign up να γίνεται generate_password_hash οπότε δεν είναι συμβατοί οι κωδικοί και ο έλεγχος επιστρέφει None. Θα αφαιρέσω για αρxή τον έλεγχο με το hash, να τσεκάρει απλά ότι το password με το attribute του user: userpassword κάνουν match.

Το chatgpt εξηγεί πολύ καλά αυτή την διαφοροποίηση:

redirect(url_for("views.home")) is used to redirect the user to a different page in your Flask application. When the user accesses the page containing this code, they will be immediately redirected to the specified page, which in this case is the home view function in the views module. This is useful when you want to force the user to go to a different page, for example after they have submitted a form or when they are not authorized to access a certain page.

render_template("home.html") is used to render an HTML template and display it to the user. When the user accesses the page containing this code, Flask will look for a template called home.html in the templates directory of your Flask application and render it with any context variables that you pass to the function. This is useful when you want to display a page to the user with dynamic content, such as data retrieved from a database or user input from a form.

for future use, QUERY to activate a user:
UPDATE app_user
SET is_active = 1
WHERE username = "user_to_be_activated";

get books per school:
SELECT book_copies_per_school.\*
FROM book_copies_per_school
WHERE book_copies_per_school.school_id = "school_id(placeholder)";
