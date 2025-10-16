# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def mergeTwoLists(self, list1: Optional[ListNode], list2: Optional[ListNode]) -> Optional[ListNode]:
        temp_head = ListNode(0) # 哨兵节点（虚拟头）。它不存有效数据，只是为了避免“头结点要特殊处理”的麻烦。最终返回 temp_head.next 才是真正的合并后头结点。
        tail = temp_head # 结果链表的尾巴。每次接上一个节点后，tail 往前移动到新尾上，保证“下一次接在这里”。
        #pointer
        p1,p2 = list1, list2 # two pointer, 分别在两个链表向前走
        while (p1 is not None) and (p2 is not None): # 两个都没走完就持续比较
            if p1.val <=p2.val: # 把较小（或相等）的节点接到结果链表尾部
                tail.next = p1
                p1 = p1.next
            else:
                tail.next = p2
                p2 = p2.next
            tail = tail.next # 尾指针也要随之前进到新尾部。
        
        tail.next = p1 if (p1 is not None) else p2 # 其中一个链表还可能有剩余；直接把整段挂到结果尾部
        return temp_head.next