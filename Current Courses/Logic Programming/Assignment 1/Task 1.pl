% avoiding the use of singleton variables,
% https://www.swi-prolog.org/FAQ/SingletonVar.html
% using the anonymous variable instead:
student_bl(id(_), name(_, _, _), address(_, _, _, _), university(_, _, _, _)).
% student_bl: a student "blueprint"
% id(_): contains student's id
% name(_, _, _): contains student's first name, middle name and last name
% address(_, _, _, _): contains student's street, street number, postal code and city
% university(_, _, _, _): contains student's university, faculty, department and subprogram

student(ID) :-
    student_bl(id(ID), _, _, _).
