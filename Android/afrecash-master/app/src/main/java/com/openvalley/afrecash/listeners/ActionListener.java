package com.openvalley.afrecash.listeners;

/**
 * @author Geek Nat
 *         On 9/19/2016.
 */
public interface ActionListener {
    void onActionDeleted(String cancelMessage);

    void onActionCompleted(Object o, int pos);
}
