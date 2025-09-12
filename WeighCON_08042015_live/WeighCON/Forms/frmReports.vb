Public Class frmReports

    Sub New()
        InitializeComponent()

        ma = New Padding(50, 0, 0, 0)
        sizes = New Size(24, 24)
        init(Me)
    End Sub

    Private Sub frmReports_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'TODO: This line of code loads data into the 'WeighconDataSet.ITEMLOG' table. You can move, or remove it, as needed.

        'TODO: This line of code loads data into the 'WeighconDataSet.ITEMLOG' table. You can move, or remove it, as needed.



    End Sub



    Private Sub ITEMLOGBindingNavigatorSaveItem_Click_1(ByVal sender As System.Object, ByVal e As System.EventArgs)
        Me.Validate()


    End Sub
End Class