public with sharing class Task {
    public  void task1() {
      List<Account> list1 = [SELECT Id , Name FROM Account limit 20];
              System.debug(list1.size());

              List<Account> list2 = new List<Account>();
              for (Integer i = 0; i<list1.size(); i++)
              {
                if(!(Math.mod(i,2)==0)){
                      list2.add(list1[i]);}
              }
                       
              System.debug('list2'+ list2);
              System.debug(list1);
                
      
               
               List<Account> list3 = new List<Account>();
               if(!(list2.isEmpty() && list1.isEmpty())){
                list3.addAll(list2);
                list3.addAll(list1);
               }
            set<Id> set1 = new set<Id>();
            for(Integer i = 0; i<list3.size();i++){
                set1.add(list3.get(0).Id);
            }
            System.debug('store the Account Ids into the Set1' + set1);

            for(Account acc:list2){
              if(set1.contains(acc.Id)){
                System.debug('Id'+ acc.Id);
              }
            }
            Map<Id,List<Account>> mapAcc = new Map<Id,List<Account>>();
    System.debug(mapAcc); 
    for(Account acc : list3){
      if(!mapAcc.containsKey(acc.Id)){
        mapAcc.put(acc.Id, new List<Account>());
        mapAcc.get(acc.Id).add(acc);
      }
      else{
        mapAcc.get(acc.Id).add(acc);
      }
      System.debug(mapAcc);
    }
    set<Id> set2 = new set<Id>();
    set<Id> setKey = mapAcc.keyset();
      for(Id setvar : setKey){
        if(set1.contains(setvar)){
           set2.add(setvar);
        }
        System.debug('set2'+ set2);
      }
      for(Integer i = 0; i<set2.size(); i++){
        if(setKey.contains(list2.get(0).Id)){
          mapAcc.remove(list2.get(0).Id);
        }
      }
      System.debug(mapAcc);

      List<Id> list4 = new list<Id>();
      
      for(id setvars :setKey ){
        list4.add(setvars);
      }
      System.debug('list1'+ list1);
      
      List<List<Account>>list5 = new List<List<Account>>(mapAcc.values());
          System.debug('list' + list5);
      
      
          list1.clear();
          list2.clear();
          set2.clear();
          System.debug('clear '+ list1);
          System.debug('clear'+list2 );
          System.debug('clear'+ set2);

          for(Integer i = 0; i<list1.size();i++){
            set1.remove(list1.get(i).Id);
          }
          System.debug(set1);
    }
    
}
