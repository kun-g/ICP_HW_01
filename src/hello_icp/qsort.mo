import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Int "mo:base/Int";
import Array "mo:base/Array";

func qsort(arr: [Int]): [Int] {
    let result = Array.thaw<Int>(arr);
    _qsort(result, 0, arr.size()-1);
    Array.freeze<Int>(result);
};

func _qsort(arr: [var Int], low: Int, high: Int) {
    if (low < high) ignore {
        // Debug.print("Partion " # Int.toText(low) # " " # Int.toText(high));

        let pivot = partion(arr, low, high);
        _qsort(arr, low, pivot-1);
        _qsort(arr, pivot+1, high);
    };
};

func partion(arr: [var Int], low: Int, high: Int): Int {
    var pivot = arr[Int.abs(low)];
    var l = low;
    var h = high;

    while (l < h) ignore {
        while (arr[Int.abs(l)] < pivot and l < h) ignore {
            l += 1;
        };

        while (arr[Int.abs(h)] > pivot and l < h) ignore {
            h -= 1;
        };

        if (l < h) {
            let tmp = arr[Int.abs(l)];
            arr[Int.abs(l)] := arr[Int.abs(h)];
            arr[Int.abs(h)] := tmp;
            l += 1;
        };


    };
    // arr[Int.abs(l)] := pivot;
    // arr[Int.abs(low)] := arr[Int.abs(l)];
    // arr[Int.abs(l  )] := pivot;

    l;
};

func printArray(arr: [Int]) {
    for (e in arr.vals()) ignore {
        Debug.print(Int.toText(e));
    };
};

Debug.print("1==========");
printArray(qsort([5]));
Debug.print("2==========");
printArray(qsort([4, 5]));
Debug.print("3==========");
printArray(qsort([5, 4, 3]));
 Debug.print("4==========");
 printArray(qsort([5, 4, 3, 2]));
 Debug.print("5==========");
 printArray(qsort([5,2,3,1,4]));
 Debug.print("6==========");
 printArray(qsort([5,2,1,4]));
 Debug.print("7==========");
 printArray(qsort([1,2,3,4]));
 Debug.print("8==========");
 printArray(qsort([4,3,2,1]));
 Debug.print("9==========");
 printArray(qsort([2, 4,3,2,1]));