# Time Complexity Workshop


### February Cohort: Please submit your answers [HERE](https://goo.gl/forms/yduPdCGbVW89PCio2)

Today we're going to practice analyzing a few functions' time complexities. This is a unique topic; you'll have to be able to conjure the time complexity of your code on the spot in interviews, and you'll be expected to do so without the benefit of Googling the basics (like "What is a logarithm?").

1. Explain this as clearly as possible to your partner. Take good notes
on how you're answering each question. The more detailed your answers, the better you'll be able to compare them to the solutions.
2. Open up the [solutions][solutions]. After you solve each problem, switch
over to the solutions to make sure you and your partner got it right and to
be sure that you understand before moving on! Don't look ahead in the solutions!
3. The partner sitting on the left is now **Partner A**, and on the right sits **Partner B**.

Notice also that we are somewhat language agnostic in this assignment -- that't intentional. Some of the subtler time complexity points do depend upon what language you're using, but for the most part the language won't matter for the big stuff. There are some exceptions, but for today, assume language doesn't matter.

Sally forth!  

### Arrays Are Awesome

Let's start with some array manipulation to get us warmed up. Find the time complexity of each of the following functions (in order -- they depend on each other). You may assume that all arrays are arrays of integers, for convenience. When you evaluate time complexity, remember to do each of the following:

1. Specify which aspect (or aspects) of the input the time complexity depends on. E.g., if a function is `O(n)`, what is *n*?
2. Explain thoroughly and clearly *why* the time complexity is what it is.
3. Find the *worst* cases.
3. Discuss space complexity too: this is usually deemphasized over time complexity, but some interviewers will ask about it.

**NB**: you can assume that any print statements (`console.log`, `puts`, etc.) run in constant time. We'll come back to this near the end, but this is also a safe assumption to make in interviews.

So, what's the time complexity of this function? Remember to find those constant factors as well as the overall time complexity, especially for these simple examples. **Partner A**, explain this one to **Partner B**.

1.
```ruby
def add(a, b)
  if a > b
    return a + b
  end

  a - b
end

```
Time-Complexity: O(1), Constant
Space-Complexity: O(1), Constant
What is n: In this example, only simple mathematical operations are done
on the input, and they are only done once.
Why: The number of operations will never change, regardless of how large
the two inputs become.
Big Omega: In the worst case, 2 operations will be done, a comparison and
simple addition. This still leaves us with O(1)

Ok, now move onto this one. It's **Partner B**'s turn to explain:  

2.
```ruby
def print_arr_1(arr)
  arr.each do |idx|
    puts idx
  end
end
```
Time-Complexity: O(n), Linear
Space-Complexity: O(1), Constant
What is n: In this example, the input is iterated over a single time, with
a constant operation done in addition. The input arr is n
Why: For each element within the input, a constant time action is executed,
since the number of these actions grows linear to the growth of the arr
it is Linear-Time.
Big Omega: There is very little variation in the number of possible actions
this algorithm can take, thus it's worst case is still O(n)

Great, two easy ones out of the way! Now, what happens when we add just one more line? What changes, and what stays the same? (Don't forget about those constant factors!)

**NB**: alternate who does the explaining for the rest of the Warm-Ups.

3.
```ruby
def print_arr_2(arr)
  arr.each_with_index do |el, idx|
    break if idx == arr.length/2 - 1
    puts el
  end
end
```
Time-Complexity:O(n), Linear
Space-Complexity: O(1), No new spaces of memory are needed
What is n: n is the number of elements in the arr.
Why: Despite this algorithm cutting itself short half-way through, the
underlying principle's remain the same as the previous problem. As the number
of inputs grow, the number of constant operations grows linearly
Big Omega: O(n), there is no worst case.

Let's make another change, again asking ourselves how the time complexity is affected.

4.
```ruby
def print_arr_3(arr)
  arr.each do |el|
    break if el == arr.length/2 - 1
    puts el
  end
end
```
Time-Complexity: O(n), Linear
Space-Complexity: O(1)
What is n: n is the number of elements in the arr that will be printed
Why: We are only going over the array a single time, though we are sporadically leaving
unfinished
Big Omega: O(n), this algorithm has little variation in it's operations

Finally, let's add a little bit to our code.

5.
```ruby
def print_arr_4(arr)
  arr.each do |el|
    break if el == arr.length/2 - 1
    puts el
  end

  arr.each_with_index do |el, idx|
    puts el if idx % 3 == 0
  end

  puts arr.last
end
```
Time-Complexity: O(n), Linear
Space-Complexity: O(1)
What is n: In this case n is the information related to the positions of
the input array, namely Index and Element. The actual runtime of this appears
to be n/2 + n/3 + 1, which is still O(n)
Why: Despite two loops being done, they still only grow in direct proportion
to the input's size, thus Linear Time Complexity
Big Omega: O(n)

Now let's make a bigger change.  Define a basic `search` function as follows:

6.
```ruby
def search(arr, target)
  arr.each_with_index do |el, idx|
    return idx if el == target
  end
end
```
Time-Complexity: Best: O(1), Constant Avg: O(n), Linear
Space-Complexity: O(1)
What is n: n, in this case, is still the number of elements contained in
the input array.
Why: The best scenario for this algorithm is one in which the target is
the first element contained within the array, but the average case is
one in which it is in the middle of the array.
Big Omega: O(n), in which the target is either the last element or is not
contained within the array, necessitating a thorough search of the array.

Now, let's use this `search` within another function.  Determine the time complexity of the following:

7.
```ruby
def searchity_search(arr, target)
  results = []
  arr.each do |el|
    results << search(arr, target + el)
  end

  results  
end
```
Time-Complexity: O(n^2), Quadratic
Space-Complexity: O(n)
What is n: In this case, n is the number of elements within the array
Why: Because this method loops over the array for each element within the
array, the algorithms growth is exponential.
Big Omega: Since there is zero decision logic within this algorithm, it will
complete it's runtime regardless of how pathological the inputs are.

You may have noted that the *nested* nature of `search` within the loop of this function affects this drastically. But not all loops are created equal. Think carefully about this one:

8.
```ruby
def searchity_search_2(arr, target)
  results = []
  arr.each do |el|
    results << search(arr, el)
  end

  results  
end
```
Time-Complexity:O(n^2), Quadratic
Space-Complexity: O(n), Linear
What is n: n is the number of elements within the input array
Why: Despite this algorithm's "ability" to always find it's 'target', the
time it takes to complete this task is still going to grow exponentially
in relation to the size of the input array.
Big Omega: O(n^2), This algorithm will never not find what it's looking for.


### Interacting with Iterativeness

Let's leave the arrays behind for a bit, and look at a few other functions. Start with **Partner A** explaining the time complexity of this one:

1.
```javascript
let iterative_1 = (n, m) => {
  let notes = ["do", "rei", "mi", "fa", "so", "la", "ti", "do"];

  for (var i = 0; i < n; i++) {
    for (var j = 0; j < m; j++) {
      let position = (i+j) % 8;
      console.log(notes[position]);
    }
  }
}
```
Time-Complexity: O(n^2), Quadratic
Space-Complexity: O(1)
What is n: In this case, n is both inputs n and m.
Why: Because for every increase in n we see another m number of computations,
this leads to an exponentially growing number of computations as both n and m increase.
Big Omega: O(n^2)

How do things change when we make this subtle alteration?

2.
```javascript
let iterative_2 = (n) => {
  let notes = ["do", "rei", "mi", "fa", "so", "la", "ti", "do"];

  for (var i = 0; i < n; i++) {
    for (var j = i; j >= 0; j--) {
      let position = (i+j) % 8;
      console.log(notes[position]);
    }
  }
}
```
<!--Wrong: In this case, n is the number of loops that must be taken, but
log n is the number of sub-loops that must be taken.
Why: Instead of looping a fixed number of times as n increases or looping
an increasing number of times as n increases, this algorithm will loop almost
up to n before stopping. This still requires n number of loops, but the
number of sub loops only approaches n. -->
Time-Complexity:O(n^2), Quadratic
Space-Complexity:O(1)
What is n: In this case, n is the number of loops that must be taken, both
for the inner and outer set of loops.
Why: Despite the inner-loop's loop count being smaller during each step of
the outer loop, It's growth pattern still expands exponentially higher as
n grows. For each loop n, we still have to do another set of n number of
inner loops.
Big Omega:O(n^2)

Now, let's combine both ideas. What's the time complexity of this function?

3.
```javascript
let iterative_3 = (n, m) => {
  let notes = ["do", "rei", "mi", "fa", "so", "la", "ti", "do"];

  let bigger = n > m ? n : m;
  let smaller = n <= m ? n : m;

  for (var i = 0; i < smaller; i++) {
    for (var j = i; j < bigger; j++) {
      let position = (i+j) % 8;
      console.log(notes[position]);
    }
  }
}
```
Time-Complexity:O(n^2), Quadratic
Space-Complexity: 0(1)
What is n: n in this case is both inputs n and m
Why: Despite trying to force the smaller of the two inputs into the outer
loop, this strategy falls apart over the long term as this algorithms
Time-Complexity still grows exponentially as either input grows towards
infinity.
Big Omega: O(n^2)


### Radical Recursion

Recursive functions are among the toughest to evaluate for time complexity. Remember **FFS**:

1. <b>F</b>ind the time complexity of *one call*, ignoring the recursive calls,
2. <b>F</b>ind the number of times the function is called, and, if necessary, the input sizes on all of those calls.
3. <b>S</b>um everything together.

Let's start with something nice and simple. Don't forget to find the constant factor! (As a bonus, figure out a better name for this function than `rec_mystery` -- what is it doing?)

4.
```ruby
def rec_mystery(n)
  return n if n < 5

  rec_mystery(n - 5)
end
```
Name: modulo_five
Time-Complexity: Best Case: O(1) Avg Case: O(n), Linear
Space-Complexity: O(n), Best Case: O(1)
What is n: In this case, n is simply the number you are trying to reduce
Why: This algorithm attempts to reduce the input down to a number below
five. As the input number grows larger the number of stack-frames needed
grows linearly along-side.
Big Omega: O(n), the Worst Case is an astronomically large number.

Let's change things ever so slightly.  Now what is the time complexity?

5.
```ruby
def rec_mystery_2(n)
  return 0 if n == 0

  rec_mystery_2(n/5) + 1
end
```
<!-- Wrong: Because after the number gets reduced to 0 (1/5 == 0), the next
propagation step up will increase it by 1, necessitating another recursive
call since it is no longer equal to 0. -->
Time-Complexity: O(log n), Logarithmic
Space-Complexity: O(log n)
What is n: In this case, n is simply the input number
Why: Because we are dividing n by 5, our total number of divisions can be
written as 5^num_of_divs = n, and when you reverse this: num_of_divs = log(5) * n
Big Omega:


Now let's add in a bit of complexity with some extra variables in the mix.

6.
```java
void rec_mystery_3(int n, int m, int o)
{
  if (n <= 0)
  {
    printf("%d, %d\n", m, o);
  }
  else
  {
    rec_mystery_3(n-1, m+1, o);
    rec_mystery_3(n-1, m, o+1);
  }
}
```
Time-Complexity: O(2^n), Exponential
Space-Complexity: O(n^2)
What is n: n in this case is actually just the single input n
Why: Because we generate 2 stack frames for every digit n is above 0, and each
of those stack frames generates another frame, we get an exponentially
increasing number of frames that grows larger as the input n increases.
Big Omega: O(2^n)


The next one is a bit harder. If you're stumped, feel free to take a look
at the solution, and then come back and try to explain in your own words.

7.
```ruby
class Array
  def grab_bag
    return [[]] if empty?
    bag = take(count - 1).grab_bag
    bag.concat(bag.map { |handful| handful + [last] })
  end
end
```
Time-Complexity: O(2^n), Exponential
Space-Complexity:O(2^n)
What is n: n in this case is the number of elements in the array that the
algorithmic method is being called on
Why: Because our bag will contain the subsets of all the elements in the
array partnered with the last element, we are going to see a
Big Omega:

At this point, look over your notes and answers to make sure you understand how you've solved each question.

Well done! If you finished early, go ahead and start watching the
[Video Lectures](https://github.com/appacademy/sf-job-search-curriculum/blob/master/w12/day1.md#afternoon) on Arrays that you'll need for the project tonight.

[solutions]: ./big_o_solutions.md
