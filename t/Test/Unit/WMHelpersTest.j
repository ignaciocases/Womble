@import <OJUnit/OJTestCase.j>
@import <WM/Array.j>
@import <WM/Dictionary.j>
@import <WM/Helpers.js>

@implementation WMHelpersTest : OJTestCase

- (void) testLength {
    var jsArray = new Array();
    jsArray[2] = "foo";
    jsArray[5] = "bar";

    var objjArray = [WMArray arrayFromObject:["foo", "bar", "baz"]];

    [self assert:_p_length(jsArray) equals:6 message:"JS array length correct"];
    [self assert:_p_length(objjArray) equals:3 message:"OJ array length correct"];
}

- (void) testKeys {
    var o = new Object();
    o.foo = "bar";
    o.baz = "bum";

    var oo = [WMDictionary dictionaryFromObject:{ "foo":"bong", "bar":"zab" }];

    [self assert:_p_keys(o).length equals:2 message:"JS obj/dictionary keys kosher"];
    [self assert:_p_keys(oo).length equals:2 message:"OJ obj keys kosher"];
}

- (void) testArrayManipulation {
    var ja = ["a", "b"];
    var oja = [WMArray arrayFromObject:["a", "b"]];

    [self assert:_p_length(ja) equals:2 message:"JS array length starts off ok"];
    [self assert:_p_length(oja) equals:2 message:"OJ array length starts off ok"];

    _p_push(ja, "arse");
    _p_push(oja, "arse");
    [self assert:_p_length(ja) equals:3 message:"JS array length ok after push"];
    [self assert:_p_length(oja) equals:3 message:"OJ array length ok after push"];

    [self assert:_p_objectAtIndex(ja, 2) equals:"arse" message:"dereferencing JS array correct"];
    [self assert:_p_objectAtIndex(oja, 2) equals:"arse" message:"dereferencing OJ array correct"];

    _p_setObjectAtIndex(ja, "bandit", 2);
    _p_setObjectAtIndex(oja, "banana", 2);

    [self assert:_p_objectAtIndex(ja, 2) equals:"bandit" message:"setting object in JS array correct"];
    [self assert:_p_objectAtIndex(oja, 2) equals:"banana" message:"setting object in OJ array correct"];

}

- (void) testDictionaryManipulation {
    var jd = { "a":"arse", "b":"bandit" };
    var ojd = [WMDictionary dictionaryFromObject:{ "a":"arse", "b":"bandit", }];

    [self assert:_p_length(_p_keys(jd)) equals:2 message:"correct number of keys"];
    [self assert:_p_length(_p_keys(ojd)) equals:2 message:"correct number of keys"];
    [self assert:_p_length(_p_values(jd)) equals:2 message:"correct number of values"];
    [self assert:_p_length(_p_values(ojd)) equals:2 message:"correct number of values"];

    _p_setValueForKey(jd, "fudge", "f");
    _p_setValueForKey(ojd, "fudge", "f");

    [self assert:_p_length(_p_keys(jd)) equals:3 message:"correct number of keys"];
    [self assert:_p_length(_p_keys(ojd)) equals:3 message:"correct number of keys"];
    [self assert:_p_length(_p_values(jd)) equals:3 message:"correct number of values"];
    [self assert:_p_length(_p_values(ojd)) equals:3 message:"correct number of values"];
    [self assert:_p_valueForKey(jd, "f") equals:"fudge" message:"value for key is correct"];
    [self assert:_p_valueForKey(ojd, "f") equals:"fudge" message:"value for key is correct"];
}

- (void) testIsArray {
    var ja = ["a", "b"];
    var oja = [WMArray arrayFromObject:["c", "d"]];
    var js = "I am a string";
    var ojs = @"I am a CP string";
    var jd = { "a":"foo", "b":"bar" };
    var ojd = [WMDictionary dictionaryFromObject:{ "a":"foo", "b":"bar" }];

    [self assertTrue:_p_isArray(ja) message:"Javascript array identified"];
    [self assertTrue:_p_isArray(oja) message:"OJ array identified"];
    [self assertFalse:_p_isArray(js) message:"Javascript string not identified"];
    [self assertFalse:_p_isArray(ojs) message:"OJ string not identified"];
    [self assertFalse:_p_isArray(jd) message:"Javascript dictionary not identified"];
    [self assertFalse:_p_isArray(ojd) message:"OJ dictionary not identified"];
}

@end
