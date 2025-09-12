using DevExpress.XtraBars.Ribbon;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Coffee
{
    internal interface iCoffee
    {
        void loaddata();
        void newitem();
        void edititem<T>(T data);
        void deleteitem<T>(T data);
        Form form { get; }
        Form CardForm { get; }
    }
    public interface IRibbon
    {
        RibbonControl Ribbon { get; }
         Formtype formtype { get; } 
    }
    public interface Iform
    {
        Form form { get; }
    }
//#error version
    public enum Formtype {List,Card }
}
