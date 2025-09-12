package com.trimline.paul.m_branch.teller;

import androidx.databinding.BaseObservable;

import com.trimline.paul.m_branch.BR;
import com.trimline.paul.m_branch.enums.transaction_Type;

import java.util.List;

public class ViewModel extends BaseObservable {
    private List<transaction_Type> spinnerItems;
    private transaction_Type selectedItem;


    // Getter method
    public transaction_Type getSelectedItem() {
        return selectedItem;
    }

    // Setter method
    public void setSelectedItem(transaction_Type selectedItem) {
        this.selectedItem = selectedItem;
        notifyPropertyChanged(BR.teller); // Notify Data Binding about the property change
    }
    // Getter and setter methods for spinnerItems and selectedItem

    // Additional methods as needed
}
