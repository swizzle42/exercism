#include "simple_linked_list.h"

#include <iostream>
#include <memory>
#include <stdexcept>

namespace simple_linked_list
{

    std::size_t List::size() const
    {
        // TODO: Return the correct size of the list.
        std::size_t element_count = 0;
        auto elem = head;
        while (elem != nullptr)
        {
            ++element_count;
            elem = elem->next;
        };
        return element_count;
    }

    void List::push(int entry)
    {
        // TODO: Implement a function that pushes an Element with `entry` as data to
        // the front of the list.
        auto new_head = new Element(entry);
        new_head->next = head;
        head = new_head;
    }

    int List::pop()
    {
        // TODO: Implement a function that returns the data value of the first
        // element in the list then discard that element.

        if (this->head == nullptr)
        {
            throw std::domain_error("Trying to pop from an empty List.");
        }

        auto old_head = head;
        head = head->next;
        int data = old_head->data;
        delete old_head;
        return data;
    }

    void List::reverse()
    {
        // TODO: Implement a function to reverse the order of the elements in the
        // list.
        Element *prev = nullptr;
        Element *current = head;
        Element *next = nullptr;

        while (current != nullptr)
        {

            next = current->next;   // store the next element
            current->next = prev;   // swap next and previous
            prev = current;         // move current to prev
            current = next;         // update current to next
        }

        head = prev;    // update head to the last non-null element 
    }

    List::~List()
    {
        auto current = head;
        while (current != nullptr)
        {
            auto next = current->next;
            delete current;
            current = next;
        }
        
        head = nullptr;
    }

} // namespace simple_linked_list
