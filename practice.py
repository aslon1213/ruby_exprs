

from os import link
from typing import List


class ListNode(object):
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

def make_linked_list(arr):
    if len(arr) == 1:
        return ListNode(arr[0])
    else:
        l = ListNode()
        l.val = arr[-1]
        l.next = make_linked_list(arr[0:(len(arr) - 1)])

    return l

def from_linked_list_to_list(l):
    ls = []
    while l.next != None:
        ls.append(l.val)
        l = l.next
    ls.append(l.val)
    return ls

    
def addTwoNumbers(self, l1, l2):
    """
    :type l1: ListNode
    :type l2: ListNode
    :rtype: ListNode
    """
    print(l1)
    print(l2)
    num_1 = ''
    num_2 = ''
    num_1_list = []
    num_2_list = []
    while l1.next != None:
        num_1 += str(l1.val)
        l1 = l1.next
    num_1 += str(l1.val)
    while l2.next != None:
        num_2 += str(l2.val)
        l2 = l2.next
    num_2 += str(l2.val)

    for n in range(len(num_1)):
        num_1_list.append(num_1[len(num_1) - n - 1])
    for n in range(len(num_2)):
        num_2_list.append(num_2[len(num_2) - n - 1])
    num_1 = ''
    num_2 = ''
    for i in num_1_list:
        num_1 += i
    for i in num_2_list:
        num_2 += i
    num_3 = str(int(num_1) + int(num_2))
    l3 = ListNode()
    l4 = ListNode()
    l3.next = l4
    for i in range(len(num_3)):
        l4.val = num_3[len(num_3) - i - 1]
        l3.next = ListNode()
    l3.next = ListNode(num_3[0])

    return l3
arr_1 = [2,4,3,5,6,6,8,2,4]
arr_2 = [5,6,4]
print_list(make_linked_list(arr_1))
print_list(make_linked_list(arr_2))