### How to Use Roller Package

## Device Rolling

The package `"roller"` is for simulating "rolling" a device any given number of times. This device can be modified with n>=2 sides and different probabilities (as long as they add up to 1). This package will aid in the simulation as well as the visualization of the frequencies of the results. 

## Creating a `device`

The first step is to create a `"device"` object with the function `device()`:

```{r}
device1 <- device()
device1
```
  ##> object "device"
  ##>
  ##> sides prob
  ##> 1     0.5
  ##> 2     0.5

By default, `device()` creates a _fair_ coin with standard sides `1`, and 
`2`, and with probability values for each side of 0.5.

You can change the defatuls with arguments `sides` and `prob`:

```{r}
loaded <- device(sides = c('three', 'two'), prob = c(3/5, 2/5))
loaded
```


## Rolling a device

After defining a `"device"` object, you can use the function `roll()` to
_roll_ a device a given number of `times`. The output will be an object of class 
`"roll"`, which will contain the vector of `rolls`:

```{r}
roll50 <- roll(device1, times = 50)
roll50
```

The `summary()` function gives you a nice table of frequencies:
```{r}
summary(roll50)
```


## Plotting relative frequencies

You can use the function `plot()` to create a barplot with the relative 
frequencies of a series of rolls:

```{r, fig.show='hold'}
plot(roll50)
```
