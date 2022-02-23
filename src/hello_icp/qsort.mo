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
        while (arr[Int.abs(l)] < pivot) ignore {
            l += 1
        };
        while (arr[Int.abs(h)] > pivot) ignore {
            h -= 1
        };
        if (l < h) {
            let tmp = arr[Int.abs(l)];
            arr[Int.abs(l)] := arr[Int.abs(h)];
            arr[Int.abs(h)] := tmp;
        };
    };

    arr[Int.abs(l)] := pivot;

    l;
};

func printArray(arr: [Int]) {
    for (e in arr.vals()) ignore {
        Debug.print(Int.toText(e));
    };
};

// printArray(qsort([5]));
// printArray(qsort([5, 4]));
// printArray(qsort([5, 4, 3]));
// printArray(qsort([5, 4, 3, 2]));
// printArray(qsort([5,2,3,1,4]));
// printArray(qsort([5,2,1,4]));
// printArray(qsort([1,2,3,4]));
printArray(qsort([4,3,2,1]));