/*
Να γραφεί ένα πρόγραμμα το οποίο να προσωμοιώνει ένα απλό σύστημα
κράτησης δωματίων σε ένα ξενοδοχείο. Θεωρήστε ότι το ξενοδοχείο έχει
10 πτέρυγες με 50 δωμάτια σε κάθε πτέρυγα. Το πρόγραμμα να δίνει τη
δυνατότητα στον χρήστη να επιλέξει τις παρακάτω λειτουργίες:
1.  Εμφάνιση των ελεύθερων δωματίων σε κάθε πτέρυγα.
2.  Κράτηση δωματίου. Το πρόγραμμα να διαβάζει τον αριθμό της πτέρυγας
    και να δεσμεύει το πρώτο ελεύθερο δωμάτιο σε αυτή τη πτέρυγα. Αν
    δεν υπάρχει ελεύθερο δωμάτιο, το πρόγραμμα να προτρέπει στον
    χρήστη να εισάγει νέα πτέρυγα μέχρι να γίνει κράτηση.
3.  Ακύρωση κράτησης. Το πρόγραμμα να διαβάζει τον αριθμό της πτέρυγας
    και τον αριθμό του δωματίου και να ακυρώνει την κράτηση.
4.  Τερματισμός προγράμματος.
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#define number_of_wings 10 / 2
#define number_of_rooms 50 / 10

int randomIntGenerator(int lower, int upper)
{
    //  int M, N;
    //  M = N = 0;
    //  return M + rand() / (limit / (N - M + 1) + 1);
    return (rand() % (upper - lower + 1)) + lower;
}

int isEmpty(int room)
{
    if (room == 0)
    {
        return 1;
    }
    else
    {
        return 0;
    }
}

void initialize_hotel(int hotel[][number_of_rooms])
{
    int wing_counter, room_counter;
    for (wing_counter = 0; wing_counter < number_of_wings; wing_counter++)
    {
        for (room_counter = 0; room_counter < number_of_rooms; room_counter++)
        {
            hotel[wing_counter][room_counter] = 0;
        }
    }
}

int count_reserved_rooms_in_wing(int hotel[number_of_rooms])
{
    int room_counter, room, counter = 0;
    for (room_counter = 0; room_counter < number_of_rooms; room_counter++)
    {
        room = hotel[room_counter];
        if (!isEmpty(room))
        {
            counter++;
        }
    }
    return counter;
}

void print_hotel_rooms_state(int hotel[][number_of_rooms])
{
    int wing_counter, room_counter, room;
    for (wing_counter = 0; wing_counter < number_of_wings; wing_counter++)
    {
        printf("Wing %i:\n", wing_counter + 1);
        for (room_counter = 0; room_counter < number_of_rooms; room_counter++)
        {
            room = hotel[wing_counter][room_counter];
            if (isEmpty(room))
            {
                printf("\tRoom %i:\t%s\n", room_counter + 1, "Empty");
            }
            else
            {
                printf("\tRoom %i:\t%s\n", room_counter + 1, "Reserved");
            }
        }
        int number_of_reserved_rooms = count_reserved_rooms_in_wing(hotel[wing_counter]);
        printf("Reserved rooms:\t%i\n", number_of_reserved_rooms);
        printf("Empty rooms:\t%i\n", number_of_rooms - number_of_reserved_rooms);
    }
}

void reserve_room(int hotel[][number_of_rooms], int wing_number, int room_number)
{
    hotel[wing_number][room_number] = 1;
}




int main()
{
    srand(time(NULL));

    int hotel[number_of_wings][number_of_rooms];

    initialize_hotel(hotel);
    print_hotel_rooms_state(hotel);

    for (int i = 0; i < randomIntGenerator(1, number_of_rooms * number_of_wings); i++)
    {
        reserve_room(hotel, randomIntGenerator(0, number_of_wings), randomIntGenerator(0, number_of_rooms));
    }
    print_hotel_rooms_state(hotel);

    return 0;
}
