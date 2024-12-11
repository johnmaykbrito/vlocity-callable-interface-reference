global class MyPicklistOptions implements Callable
{
    /*
        inputs - arguments - List<Object> of passed in arguments
        output - result - The result of the Function being called. Supports single Object values, List<Object> or Map<String, Object>
    */
    public Object call(String action, Map<String, Object> args)
    {

        Map<String, Object> input = (Map<String, Object>)args.get('input');
        Map<String, Object> output = (Map<String, Object>)args.get('output');
        Map<String, Object> options = (Map<String, Object>)args.get('options');

        return invokeMethod(action, input, output, options);
    }

    public Boolean invokeMethod(String methodName, Map < String, Object > input, Map < String, Object > outMap, Map < String, Object > options)
    {
        if(methodName.equals('AccountNames'))
        {
            List <Map<String, String>> UIoptions = new List <Map<String, String>>();
            for(Account acc : [Select id,Name from Account])
            {
                Map < String, String > tempMap = new Map < String, String > ();
                tempMap.put('name', acc.Id);
                tempMap.put('value', acc.Name);
                UIoptions.add(tempMap);
            }
            outMap.put('options', UIoptions);
        }
        else if( methodName.equals('ContactNames'))
        {
            List <Map<String, String>> UIoptions = new List <Map<String, String>> ();
            for(Contact con : [Select id,Name from Contact])
            {
                Map < String, String > tempMap = new Map < String, String > ();
                tempMap.put('name', con.Id);
                tempMap.put('value', con.Name);
                UIoptions.add(tempMap);
            }
            outMap.put('options', UIoptions);
        }
        return true;
    }
}