#include <stdio.h>
#include <stdlib.h>

struct Node {
	int data;
	struct Node* next;
	struct Node* prev;
};


void push(struct Node** head_ref, int new_data){
	struct Node* new_node = malloc(sizeof(struct Node)); // allocate a block of memory on the heap.
	
	new_node->data = new_data;

	new_node->prev = NULL;
	new_node->next = (*head_ref); 

	if ((*head_ref) != NULL){
		(*head_ref)->prev = new_node;
	}
	(*head_ref) = new_node;
	
}	

void append(struct Node** head_ref, int new_data){
    struct Node* new_node = malloc(sizeof(struct Node));
    struct Node* last_node = *head_ref;
 
    new_node->data = new_data;
    new_node->next = NULL;
	
    if (*head_ref == NULL) {
        new_node->prev = NULL;
        *head_ref = new_node;
        return;
    }
 
    while (last_node->next != NULL)
        last_node = last_node->next;
 
    last_node->next = new_node;
    new_node->prev = last_node;
 
    return;
}


void deleteNode(struct Node** head_ref, struct Node* target){
	//^ base case */
	if (*head_ref == NULL || target == NULL)
		return;

	//^ If node to be deleted is head node 
	if (*head_ref == target)
		*head_ref = target->next;

	//^ Change next only if node to be deleted is NOT the last node 
	if (target->next != NULL)
		target->next->prev = target->prev;

	//^ Change prev only if node to be deleted is NOT the first node 
	if (target->prev != NULL)
		target->prev->next = target->next;

	//^ Finally, free the memory occupied by del
	free(target);
	printf("Modified Linked list -> "), printList(*head_ref), printf("\n");
	return;
}

void printList(struct Node* node){
	while (node != NULL) {
		printf("%d ", node->data);
		node = node->next;
	}
}

int main(){
	struct Node* head = NULL; 

	push(&head, 2);
	push(&head, 4);
	push(&head, 8);
	
	append(&head, 100);
	push(&head, 10);

	printf("Original Linked list -> "), printList(head), printf("\n");

	//deleteNode(&head, head); //^ delete first node

}
