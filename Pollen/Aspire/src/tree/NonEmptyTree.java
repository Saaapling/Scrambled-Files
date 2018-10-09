package tree;

import java.util.Collection;
import java.util.LinkedHashSet;


/**
 * This class represents a non-empty search tree. An instance of this class
 * should contain:
 * <ul>
 * <li>A key
 * <li>A value (that the key maps to)
 * <li>A reference to a left Tree that contains key:value pairs such that the
 * keys in the left Tree are less than the key stored in this tree node.
 * <li>A reference to a right Tree that contains key:value pairs such that the
 * keys in the right Tree are greater than the key stored in this tree node.
 * </ul>
 *  
 */
public class NonEmptyTree<K extends Comparable<K>, V> implements Tree<K, V> {

	/* Provide whatever instance variables you need */
	private K key;
	private V value;
	private Tree<K,V> left, right;

	/**
	 * Only constructor we need.
	 * @param key
	 * @param value
	 * @param left
	 * @param right
	 */
	public NonEmptyTree(K key, V value, Tree<K,V> left, Tree<K,V> right) {
		this.key = key;
		this.value = value;
		this.left = left;
		this.right = right;
	}

	public V search(K key) {
		int result = key.compareTo(this.key);

		if (result < 0) {
			return left.search(key);
		}else if (result > 0) {
			return right.search(key);
		}

		return value;
	}

	public NonEmptyTree<K, V> insert(K key, V value) {
		int result = key.compareTo(this.key);

		if (result < 0) {
			left = left.insert(key, value);
		}else if (result > 0) {
			right = right.insert(key, value);
		}else if (result == 0) {
			this.value = value;
		}

		return this;
	}

	public Tree<K, V> delete(K key) {
		int result = key.compareTo(this.key);

		if (result < 0) {
			left = left.delete(key);
		}else if (result > 0) {
			right = right.delete(key);
		}else if (result == 0) {
			try {							//Assuming the right branch of the tree exists
				K tempKey = right.min();
				this.value = search(tempKey);
				delete(tempKey);
				this.key = tempKey;
			} catch (TreeIsEmptyException e) {
				return left;
			}
		}

		return this;
	}

	public K max() {
		try {
			return right.max();
		} catch (TreeIsEmptyException e) {
			return key;
		}
	}

	public K min() {
		try {
			return left.min();
		} catch (TreeIsEmptyException e) {
			return key;
		}
	}

	public int size() {
		return 1 + left.size() + right.size();
	}

	public void addKeysToCollection(Collection<K> c) {
		c.add(key);
		left.addKeysToCollection(c);
		right.addKeysToCollection(c);
	}

	public PolymorphicBST<K,V> subTree(K fromKey, K toKey) {
		PolymorphicBST<K, V> tree = new PolymorphicBST<K, V>();
		tree.root = EmptyTree.getInstance();
		LinkedHashSet<K> keys = new LinkedHashSet<K>();

		if (key.compareTo(fromKey) >= 0 && key.compareTo(toKey) <= 0) {
			tree.put(key, value);
			left.subTree(fromKey, toKey).root.addKeysToCollection(keys);
			right.subTree(fromKey, toKey).root.addKeysToCollection(keys);
		}
		if (key.compareTo(fromKey) < 0) {
			right.subTree(fromKey, toKey).root.addKeysToCollection(keys);
		}
		if (key.compareTo(toKey) > 0) {
			left.subTree(fromKey, toKey).root.addKeysToCollection(keys);
		}

		for (K key : keys) {
			tree.put(key, search(key));
		}
		return tree;
	}

	public int height() {
		int height = 1;
		int leftHeight = left.height();
		int rightHeight = right.height();

		if (leftHeight > rightHeight) {
			height += leftHeight;
		}else {
			height += rightHeight;
		}

		return height;
	}

	public void inorderTraversal(TraversalTask<K,V> p) {
		left.inorderTraversal(p);
		p.performTask(key, value);
		right.inorderTraversal(p);
	}

	public void rightRootLeftTraversal(TraversalTask<K,V> p) {
		right.rightRootLeftTraversal(p);
		p.performTask(key, value);
		left.rightRootLeftTraversal(p);
	}	

	public String toString() {
		return left.toString() + value + ", " + right.toString();
	}
}