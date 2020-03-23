public class MySpecialLinkedListUtils {
	public static double[] summary(LinkedListNode head) {
		LinkedListNode temp = head;
		LinkedListNode med = head;
		int count = 0, mid = 0;
		double ar[] = new double[5];
		double sum = 0, average, median = head.value, max = head.value, min = head.value;
		while (temp != null) {
			sum += temp.value;
			if (max < temp.value) {
				max = temp.value;
			}
			if (min > temp.value) {
				min = temp.value;
			}
			count++;
			temp = temp.next;
		}
		average = sum / count;
		insertionSort(head);
		if (count % 2 != 0) {
			while (mid != (count / 2)) {
				mid++;
				med = med.next;
			}
			median = med.value;
		} else {
			while (mid != (count / 2)) {
				mid++;
				med = med.next;
			}
			median = (med.value + med.next.value) / 2;
		}
		ar[0] = sum;
		ar[1] = average;
		ar[2] = median;
		ar[3] = max;
		ar[4] = min;
		return ar;
	}

	public static LinkedListNode reverse(LinkedListNode head) {
		LinkedListNode current = head;
		LinkedListNode Pre = null;
		LinkedListNode next = null;
		while (current != null) {
			next = current.next;
			current.next = Pre;
			Pre = current;
			current = next;
		}
		return Pre;
	}

	public static LinkedListNode evenIndexedElements(LinkedListNode head) {
		LinkedListNode pre = head;
		LinkedListNode now = head.next;
		LinkedListNode k = pre;
		while (pre != null && now != null) {
			pre.next = now.next;
			now = null;
			pre = pre.next;
			if (pre != null) {
				now = pre.next;
			}
		}
		pre = k;
		return pre;
	}

	public static LinkedListNode insertionSort(LinkedListNode head) {
		LinkedListNode i = head, j = head;
		LinkedListNode k = i;
		while (i != null) {
			j = head;
			while (j != null) {
				if (i.value < j.value) {
					int temp = i.value;
					i.value = j.value;
					j.value = temp;
				}
				j = j.next;
			}
			i = i.next;

		}
		return k;
	}

	static LinkedListNode sortedMerge(LinkedListNode a, LinkedListNode b) {
		LinkedListNode result = null;
		if (a == null)
			return b;
		if (b == null)
			return a;

		/* Pick either a or b, and recur */
		if (a.value <= b.value) {
			result = a;
			result.next = sortedMerge(a.next, b);
		} else {
			result = b;
			result.next = sortedMerge(a, b.next);
		}
		return result;

	}

	public static LinkedListNode mergeSort(LinkedListNode head) {

		if (head == null || head.next == null) {
			return head;
		}
		LinkedListNode fast = head.next;
		LinkedListNode slow = head;
		while (fast != null) {
			fast = fast.next;
			if (fast != null) {
				slow = slow.next;
				fast = fast.next;
			}
		}
		LinkedListNode middle = slow;
		LinkedListNode nextofmiddle = middle.next;
		middle.next = null;
		LinkedListNode left = mergeSort(head);
		LinkedListNode right = mergeSort(nextofmiddle);
		LinkedListNode sortedlist = sortedMerge(left, right);
		return sortedlist;
	}

	public static LinkedListNode removeCentralNode(LinkedListNode head) {
		LinkedListNode slow = head;
		LinkedListNode slowprev = head;
		LinkedListNode fast = head.getNext();
		LinkedListNode k = slow;
		while (fast != null) {
			fast = fast.getNext();
			if (fast != null) {
				slowprev = slow;
				slow = slow.getNext();
				fast = fast.getNext();
			}
		}
		slowprev.next = slow.next;
		slow = null;
		return k;
	}

	public static boolean palindrome(LinkedListNode head) {
		LinkedListNode slow = head, fast = head;
		LinkedListNode slowprev = head;
		if (head != null && head.next != null) {
			while (fast != null && fast.next != null) {
				fast = fast.next.next;
				slowprev = slow;
				slow = slow.next;
			}
			if (fast != null) {
				midnode = slow;
				slow = slow.next;
			}
			LinkedListNode secondhalf = slow;
			slowprev.next = null;
			LinkedListNode prev = null;
			LinkedListNode current = secondhalf;
			LinkedListNode next;
			while (current != null) {
				next = current.next;
				current.next = prev;
				prev = current;
				current = next;
			}
			secondhalf = prev;
			while (head != null && secondhalf != null) {
				if (head.value == secondhalf.value) {
					head = head.next;
					secondhalf = secondhalf.next;
				} else {
					return false;
				}
			}
			if (head == null && secondhalf == null) {
				return true;
			}
			return false;
		}
		return false;
	}
}
