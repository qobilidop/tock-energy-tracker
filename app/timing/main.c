#include <stdio.h>

#include <internal/alarm.h>
#include <led.h>
#include <timer.h>

int main(void) {
  // Start timing
  uint32_t t_start;
  alarm_internal_read(&t_start);

  // Ask the kernel how many LEDs are on this board.
  int num_leds;
  int err = led_count(&num_leds);
  if (err < 0) return err;

  // Blink the LEDs in a binary count pattern and scale
  // to the number of LEDs on the board.
  for (int count = 0; count < 40; count++) {
    for (int i = 0; i < num_leds; i++) {
      if (count & (1 << i)) {
        led_on(i);
      } else {
        led_off(i);
      }
    }

    // This delay uses an underlying timer in the kernel.
    delay_ms(250);
  }

  for (int i = 0; i < num_leds; i++) {
    led_off(i);
  }

  // End timing and report
  uint32_t t_end, frequency;
  alarm_internal_read(&t_end);
  alarm_internal_frequency(&frequency);
  float t_elapsed = ((float) (t_end - t_start)) / ((float) frequency);
  printf("Frequency: %ld Hz\n", frequency);
  printf("Start time: %ld\n", t_start);
  printf("End time: %ld\n", t_end);
  printf("Elapsed time: %.2f seconds\n", t_elapsed);
}
