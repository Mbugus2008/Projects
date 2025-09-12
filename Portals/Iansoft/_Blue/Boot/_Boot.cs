#define Blue_Boot

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;

namespace Blue.Boot {
    public partial class Boot : BootBase {

        static Boot() {
            IntializeType();
        }

        //place custom logic in another partial-class that implements IntializeType()
        static partial void IntializeType();

        public static void Strap() {
            StrapInternal(Modules);
        }

        public static void Strap (params IModule[] orderedModules) {
            StrapInternal(orderedModules);
        }
        
    }
}
