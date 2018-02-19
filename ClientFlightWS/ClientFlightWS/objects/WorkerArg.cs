using ClientFlightWS.FlightWS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClientFlightWS
{
    public class WorkerArg
    {
        public long date { get; set; }

        public city cityFrom { get; set; }

        public city cityTo { get; set; }
    }
}
