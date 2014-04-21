package utils { 
    /**
     * Unlike the Delegate class the Proxy class allows the passing of function parameters without redefining.
     */
     
    public class Proxy {
        static public function create(referrer : *, func : Function, ...params) : Function {
            var delegate : Function = function(...parameters):* {
                return func.apply(referrer, parameters.concat(params));
            };
            return delegate;
        }
    }
}