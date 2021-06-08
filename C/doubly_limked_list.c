#include <stdio.h>
#include <stdlib.h>

struct Node {
	int data;
	struct Node* next;
	struct Node* prev;
};


void push(struct Node** head_ref, int new_data){
	
	struct Node* new_node = malloc(sizeof(struct Node));

	//^ put in the data 
	new_node->data = new_data;
	new_node->prev = NULL;

	//^ link the old list off the new node 
	new_node->next = (*head_ref);

	//^ change prev of head node to new node 
	if ((*head_ref) != NULL)
		(*head_ref)->prev = new_node;

	//^ move the head to point to the new node 
	(*head_ref) = new_node;
}

void append(struct Node** head_ref, int new_data){
    struct Node* new_node = malloc(sizeof(struct Node));
    struct Node* last = *head_ref;
 
    new_node->data = new_data;
    new_node->next = NULL;
	
    if (*head_ref == NULL) {
        new_node->prev = NULL;
        *head_ref = new_node;
        return;
    }
 
    while (last->next != NULL)
        last = last->next;
 
    last->next = new_node;
    new_node->prev = last;
 
    return;
}

void deleteNode(struct Node** head_ref, struct Node* del){
	//^ base case */
	if (*head_ref == NULL || del == NULL)
		return;

	//^ If node to be deleted is head node 
	if (*head_ref == del)
		*head_ref = del->next;

	//^ Change next only if node to be deleted is NOT the last node 
	if (del->next != NULL)
		del->next->prev = del->prev;

	//^ Change prev only if node to be deleted is NOT the first node 
	if (del->prev != NULL)
		del->prev->next = del->next;

	//^ Finally, free the memory occupied by del
	free(del);
	return;
}

void printList(struct Node* node){
	while (node != NULL) {
		printf("%d ", node->data);
		node = node->next;
	}
}

int main(){
	struct Node* head = NULL; //^ Start with the empty list 

	push(&head, 2);
	push(&head, 4);
	push(&head, 8);
	
	append(&head, 100);
	push(&head, 10);

	printf("Original Linked list -> "), printList(head);

	deleteNode(&head, head); //^ delete first node

	printf("\nModified Linked list -> "), printList(head), printf("\n");
}
