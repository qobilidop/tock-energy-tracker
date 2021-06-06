#include <stdio.h>

#include <internal/alarm.h>
#include <led.h>
#include <timer.h>

int main(void) {
  // Ask the kernel how many LEDs are on this board.
  int num_leds;
  int err = led_count(&num_leds);
  if (err < 0) return err;

  // Wait for some time before start.
  delay_ms(15000);

  // Start timing.
  uint32_t t_start;
  alarm_internal_read(&t_start);

  // Blink the LEDs in a binary count pattern and scale
  // to the number of LEDs on the board.
  for (int count = 0; count <80; count++) {
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

  // Make sure all LEDs are turned off.
  for (int i = 0; i < num_leds; i++) {
    led_off(i);
  }

  // End timing and report.
  uint32_t t_end, frequency;
  alarm_internal_read(&t_end);
  alarm_internal_frequency(&frequency);
  printf("Frequency: %ld Hz\n", frequency);
  printf("Start time: %ld\n", t_start);
  printf("End time: %ld\n", t_end);
}
