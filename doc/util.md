# util.c/.h

<style>
    com{
        color: lime;
    }
    key{
        color: pink;
    }
    typ{
        color: yellow;
    }
</style>

<pre>
<a href="#linkedlist-ll"><key>typedef struct</key> <typ>LinkedList</typ></a>{
    <com>// Warn index 0 is "funny"</com>
    <a href="#linkedlist-ll"><key>struct</key> <typ>LinkedList*</typ> <b>child</b>;</a>
    <a><key>bool</key>   <b>isEnd</b>;</a>
    <a><key>int</key>    <b>value</b>;</a>
} <a href="#linkedlist-ll"><typ>LinkedList</typ></a>;
<a href="#linkedhashtable-lht"><key>typedef struct</key> <typ>LinkedHashTable</typ></a>{
    <com>// Warn index 0 is "funny"</com>
    <a href="#linkedhashtable-lht"><key>struct</key> <typ>LinkedHashTable*</typ> <b>child</b>;</a>
    <a><key>bool</key>   <b>isEnd</b>;</a>
    <a><key>int</key>    <b>key</b>;</a>
    <a><key>int</key>    <b>value</b>;</a>
} <a href="#linkedhashtable-lht"><typ>LinkedHashTable</typ></a>;
</pre>

## LinkedList (LL)

should work!

<pre>
<a href="#summonll"    ><typ>LinkedList*</typ> <b>summonLL    </b>(                                      );</a>
<a href="#printll"     ><key>void</key>        <b>printLL     </b> ( <typ>LinkedList*</typ> <b>ll</b>                       );</a>
<a href="#freell"      ><key>void</key>        <b>freeLL      </b> ( <typ>LinkedList*</typ> <b>ll</b>                       );</a>
<a href="#appendtoll"  ><key>void</key>        <b>appendToLL  </b> ( <typ>LinkedList*</typ> <b>ll</b>, <key>int</key> <b>value</b>            );</a>
<a href="#insertinll"  ><key>void</key>        <b>insertInLL  </b> ( <typ>LinkedList*</typ> <b>ll</b>, <key>int</key> <b>value</b>, <key>int</key> <b>index</b> );</a>
<a href="#setelementll"><key>void</key>        <b>setElementLL</b> ( <typ>LinkedList*</typ> <b>ll</b>, <key>int</key> <b>value</b>, <key>int</key> <b>index</b> );</a>
<a href="#getelementll"><key>int</key>         <b>getElementLL</b> ( <typ>LinkedList*</typ> <b>ll</b>, <key>int</key> <b>index</b>            );</a>
<a href="#removefromll"><key>int</key>         <b>removefromLL</b> ( <typ>LinkedList*</typ> <b>ll</b>, <key>int</key> <b>index</b>            );</a>
<a href="#popfromll"   ><key>int</key>         <b>popFromLL   </b> ( <typ>LinkedList*</typ> <b>ll</b>                       );</a>
</pre>

### summonLL

<com>
// Your element contains random as value!
</com><br>
<a><typ>LinkedList*</typ> <b>summonLL    </b>(                                      );</a><br>
<br>

### printLL

<com>
// prints with first element
</com><br>
<a><key>void</key>        <b>printLL     </b> ( <typ>LinkedList*</typ> <b>ll</b>                       );</a><br>
<br>

### freeLL

<com>
// don't use point after!
</com><br>
<a><key>void</key>        <b>freeLL      </b> ( <typ>LinkedList*</typ> <b>ll</b>                       );</a><br>
<br>

### appendToLL

<com>
// append to end
</com><br>
<a><key>void</key>        <b>appendToLL  </b> ( <typ>LinkedList*</typ> <b>ll</b>, <key>int</key> <b>value</b>            );</a><br>
<br>

### insertInLL

<com>
// from index 0<br>
// no negatives, appends after index - (0 is ?) !
</com><br>
<a><key>void</key>        <b>insertInLL  </b> ( <typ>LinkedList*</typ> <b>ll</b>, <key>int</key> <b>value</b>, <key>int</key> <b>index</b> );</a><br>
<br>

### setElementLL

<com>
// from index 1<br>
// return value of index or last value, no negatives!
</com><br>
<a><key>void</key>        <b>setElementLL</b> ( <typ>LinkedList*</typ> <b>ll</b>, <key>int</key> <b>value</b>, <key>int</key> <b>index</b> );</a><br>
<br>

### getElementLL

<com>
// from index 1<br>
// return value of index or last value, no negatives!
</com><br>
<a><key>int</key>         <b>getElementLL</b> ( <typ>LinkedList*</typ> <b>ll</b>, <key>int</key> <b>index</b>            );</a><br>
<br>

### removefromLL

<com>
// return (value of index and remove it) or (last value, but keep it)<br>
// from index 0
</com><br>
<a><key>int</key>         <b>removefromLL</b> ( <typ>LinkedList*</typ> <b>ll</b>, <key>int</key> <b>index</b>            );</a><br>
<br>

### popFromLL

<com>
// won't pop "your" element
</com><br>
<a><key>int</key>         <b>popFromLL   </b> ( <typ>LinkedList*</typ> <b>ll</b>                       );</a><br>
<br>
<br>

## LinkedHashTable (LHT)

<pre>
<a href="#summonlht"    ><typ>LinkedHashTable*</typ> <b>summonLHT</b>    (                                         );</a>
<a href="#freelht"      ><key>void</key>             <b>freeLHT</b>      ( <typ>LinkedHashTable*</typ> <b>lht</b>                     );</a>
<a href="#insertinlht"  ><key>void</key>             <b>insertInLHT</b>  ( <typ>LinkedHashTable*</typ> <b>lht</b>, <key>int</key> <b>value</b>, <key>int</key> <b>key</b> );</a>
<a href="#setelementlht"><key>void</key>             <b>setElementLHT</b>( <typ>LinkedHashTable*</typ> <b>lht</b>, <key>int</key> <b>value</b>, <key>int</key> <b>key</b> );</a>
<a href="#getelementlht"><key>int</key>              <b>getElementLHT</b>( <typ>LinkedHashTable*</typ> <b>lht</b>, <key>int</key> <b>key</b>            );</a>
<a href="#elementgetlht"><typ>LinkedHashTable*</typ> <b>elementGetLHT</b>( <typ>LinkedHashTable*</typ> <b>lht</b>, <key>int</key> <b>key</b>            );</a>
<a href="#removefromlht"><key>int</key>              <b>removeFromLHT</b>( <typ>LinkedHashTable*</typ> <b>lht</b>, <key>int</key> <b>key</b>            );</a>
<a href="#printlht"     ><key>void</key>             <b>printLHT     </b>( <typ>LinkedHashTable*</typ> <b>lht</b>                     );</a>
</pre>

### summonLHT
<com>
// Int.MIN is your element
</com><br>
<a><typ>LinkedHashTable*</typ> <b>summonLHT</b> ( );</a>

### freeLHT
<com>
// don't use point after!
</com><br>
<a><key>void</key> <b>freeLHT</b> ( <typ>LinkedHashTable*</typ> <b>lht</b> );</a>

### insertInLHT

<com>
// insert or if present do nothing!
</com><br>
<a><key>void</key> <b>insertInLHT</b> ( <typ>LinkedHashTable*</typ> <b>lht</b>, <key>int</key> <b>value</b>, <key>int</key> <b>key</b> );</a>

### setElementLHT

<com>
// 
</com><br>
<a><key>void</key> <b>setElementLHT</b> ( <typ>LinkedHashTable*</typ> <b>lht</b>, <key>int</key> <b>value</b>, <key>int</key> <b>key</b> );</a>

### getElementLHT

<com>
// useing elementGetLHT
</com><br>
<a><key>int</key> <b>getElementLHT</b> ( <typ>LinkedHashTable*</typ> <b>lht</b>, <key>int</key> <b>key</b> );</a>

### elementGetLHT

<com>
// get LHT with key or NULL
</com><br>
<a><typ>LinkedHashTable*</typ> <b>elementGetLHT</b> ( <typ>LinkedHashTable*</typ> <b>lht</b>, <key>int</key> <b>key</b> );</a>

### removeFromLHT

<com>
// 
</com><br>
<a><key>int</key> <b>removeFromLHT</b> ( <typ>LinkedHashTable*</typ> <b>lht</b>, <key>int</key> <b>key</b> );</a>

### printlht

<com>
// 
</com><br>
<a><key>void</key> <b>printLHT</b> ( <typ>LinkedHashTable*</typ> <b>lht</b> );</a>
