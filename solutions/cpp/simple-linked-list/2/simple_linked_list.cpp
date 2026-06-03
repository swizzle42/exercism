#include "simple_linked_list.h"

#include <stdexcept>

namespace simple_linked_list
{

    std::size_t List::size() const
    {
        // TODO: Return the correct size of the list.
        return current_size;
    }

    void List::push(int entry)
    {
        // TODO: Implement a function that pushes an Element with `entry` as data to
        // the front of the list.
        auto element = std::unique_ptr<Element>(new Element(entry));
        element->next = std::move(head);
        head = std::move(element);
        current_size++;
    }

    int List::pop()
    {
        // TODO: Implement a function that returns the data value of the first
        // element in the list then discard that element.

        if (this->head == nullptr)
        {
            throw std::domain_error("Trying to pop from an empty List.");
        }

        int data = head->data;
        head = std::move(head->next);
        current_size--;
        return data;
    }

    void List::reverse()
    {
        // TODO: Implement a function to reverse the order of the elements in the
        // list.

        std::unique_ptr<Element> reversed_head{nullptr};

        while (head)
        {
            auto old_next = std::move(head->next);
            auto current = std::move(head);
            current->next = std::move(reversed_head);
            reversed_head = std::move(current);
            head = std::move(old_next);
        }

        head = std::move(reversed_head);
    }

    List::~List()
    {
        while (head)
        {
            auto next = std::move(head->next);
            head = std::move(next);
        }

        head = nullptr;
    }

} // namespace simple_linked_list
