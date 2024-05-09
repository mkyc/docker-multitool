import java.util.ArrayList;
import java.util.List;

public class OOMCrash {
    public static void main(String[] args) {
        List<byte[]> memoryHog = new ArrayList<>();
        final int chunkSize = 1024 * 1024; // 1 MiB

        try {
            while (true) {
                memoryHog.add(new byte[chunkSize]);
                System.out.println("Allocated another " + chunkSize + " bytes");
                Thread.sleep(1000);
            }
        } catch (OutOfMemoryError | InterruptedException e) {
            System.out.println("Memory consumption rate simulation ended: " + e);
        }
    }
}
